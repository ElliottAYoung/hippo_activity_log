module HippoActivityLog
  class EventsController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
    before_action :authenticate_request!, only: [:create]
    respond_to :json

    include HippoActivityLog::EventHelper

    def index
      # Ransack from given args
      render json: Event.all
    end

    def create
      build_event(params)
      render json: 'ok', status: :ok
    end

    private

    def authenticate_request!
      # unless params[:client_id] == ENV['CLIENT_ID'] && params[:client_secret] == ENV['CLIENT_SECRET'] do
      #   head :unauthorized
      # end
    end
  end
end
