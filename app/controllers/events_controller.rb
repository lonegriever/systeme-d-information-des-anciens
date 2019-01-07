class EventsController < ApplicationController
    
    def create
        @event = Event.new(event_params)
        
        if @event.save
            flash[:notice] = 'Successfully created the event.'
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
