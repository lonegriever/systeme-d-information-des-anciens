class EventsController < ApplicationController
    include SessionsHelper
    include Authenticatable
    before_action :check_if_user_is_logged_in
    before_action :check_if_user_is_an_admin, only: [:create, :new]
    def index
        @events = Event.all.order('created_at DESC').page(params[:page])
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            flash[:notice] = 'Successfully created the event.'
            redirect_to events_path
        else
            render :new
        end
    end

    def new
        @event = Event.new
    end

    private

    def event_params
        params.require(:event).permit(:file, :caption, :user_id)
    end
end
