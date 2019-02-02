module Services::Notification
    class Broadcast
        attr_reader :channel, :data_object
        def self.invoke(channel, data_object)
            self.new(channel, data_object).execute
        end

        def initialize channel, data_object
            @channel = channel
            @data_object = data_object
        end

        def execute
            ActionCable.server.broadcast(channel, data_object)
        end
    end
end