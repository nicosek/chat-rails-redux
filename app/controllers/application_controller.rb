class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :set_user

  private

  def set_user
    if current_user
      cookies[:username] = current_user.email.split('@').first || 'guest'
    end
  end
end
