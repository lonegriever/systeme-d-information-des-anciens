module Services::Notification
    class RetrieveAll
        attr_reader :offset

        def self.invoke(offset = 0)
            self.new(offset).execute
        end

        def initialize(offset)
            @offset = offset
        end

        def execute
            notification = 'Notification'.constantize
            notifs = notification.offset(offset).order('created_at DESC')
            {
                message: 'success',
                notifications: notifs,
                status: 200
            }
        end
    end
end