class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  helper_method :current_share_group

  private

  def current_share_group
    @current_share_group ||= current_user.share_group if user_signed_in?
  end
end
