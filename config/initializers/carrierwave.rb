CarrierWave.configure do |config|

    if Rails.env.development? || Rails.env.test?
        CarrierWave.configure do |config|
            config.storage = :file
        end
    end
end