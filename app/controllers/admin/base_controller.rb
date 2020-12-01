class Admin::BaseController < ApplicationController
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: I18n.t('common.errors.authorization') unless current_user.admin?
  end
end

