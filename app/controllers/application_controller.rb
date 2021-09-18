require 'action_text'

class ApplicationController < ActionController::Base
  helper ActionText::Engine.helpers

  protect_from_forgery with: :exception

  before_action :set_signed_cookie

  private

  def set_signed_cookie
    cookies.signed[:user_id] = current_user&.id
  end
end
