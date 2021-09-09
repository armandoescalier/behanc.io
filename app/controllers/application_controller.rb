require 'action_text'

class ApplicationController < ActionController::Base
  helper ActionText::Engine.helpers

  protect_from_forgery with: :exception
end
