module HippoActivityLog
  class EventsController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
    before_action :authenticate_request!
    respond_to :json

    include HippoActivityLog::EventHelper

    def index
      # Ransack from given args
      render json: queried_events(params[:filter], params[:sort], params[:page]), each_serializer: EventsSerializer
    end

    def create
      begin
        build_event(params)
        render json: 'ok', status: :ok
      rescue => e
        Raven.capture_message("#{e}. Context: #{params['event_class']} #{params['resource']}-ID #{params['object'].try(:fetch, 'id')}") if Raven
        render json: 'error', status: :bad_request
      end
    end

    private

    def authenticate_request!
      if (params[:client_id] != ENV['EVENTS_CLIENT_ID']) || (params[:client_secret] != ENV['EVENTS_CLIENT_SECRET'])
        head :unauthorized
      end
    end
  end
end
