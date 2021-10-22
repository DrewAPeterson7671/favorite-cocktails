class MyDeviseMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers

  def reset_password_instructions(record, token, opts={})
    SendgridWebMailer.send_some_email(record, token).deliver_later
  end
end