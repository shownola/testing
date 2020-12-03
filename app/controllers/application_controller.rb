class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception don't need for rails 6

  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  protected

  def resource_not_found
  end
end
