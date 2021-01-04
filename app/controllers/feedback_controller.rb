class FeedbackController < ApplicationController
  layout 'application'

  def new; end

  def create
    text  = params[:text]
    admin = User.find_by(type: 'Admin')

    if text.empty?
      redirect_to new_feedback_path, alert: t('.blank')
      return
    end

    if admin.nil?
      redirect_to new_feedback_path, alert: t('.admin')
      return
    end

    FeedbackMailer.send_mail(text, admin.email).deliver_now
    redirect_to tests_path, notice: t('.sent')
  end
end
