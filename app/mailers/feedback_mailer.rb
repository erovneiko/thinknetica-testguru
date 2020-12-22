class FeedbackMailer < ApplicationMailer
  layout 'feedback'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup: en.feedback_mailer.send_mail.subject
  def send_mail(body, email)
    @body = body
    mail to: email
  end
end
