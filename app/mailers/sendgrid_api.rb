class SendgridWebMailer < ActionMailer::Base
  include Sendgrid

  def initialize
    @client = Sendgrid::API.new(api_key: ENV[SENDGRID_API_KEY]).client
  end

  def send_some_email(record, token)
    mail = Mail.new
    mail.from = Email.new(email: mycocktails@mycocktails.devmojo.org)
    mail.subject = 'My Favorite Cocktails Registration'

    content = Content.new(
      type: 'text/html'.render(
        template: 'mailers',
        layout: nil,
        assigns: {}
      )
    )
    
    mail.contents = content

    personalization = Personalization.new
    personalization.to = Email.new(email: EMAIL, name: NAME)
    personalization.subject = SUBJECT

    mail.personalizations = personalization
    @client.mail._('send').post(request_body: mail.to_json)
  end
end



