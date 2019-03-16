class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_verified.subject
  #
    def account_verified(alumnus_record)
        @alumnus_record = alumnus_record
        mail to: @alumnus_record.email
    end
end
