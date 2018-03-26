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
      build_event(params)
      render json: 'ok', status: :ok
    end

    private

    def authenticate_request!
      if (params[:client_id] != ENV['CLIENT_ID']) || (params[:client_secret] != ENV['CLIENT_SECRET'])
        head :unauthorized
      end
    end
  end
end
