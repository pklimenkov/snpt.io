class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_getsnappt

  private

  def redirect_to_getsnappt
    redirect_to 'https://www.getsnapppt.com/'
  end

  def ahoy_cookie_path
    return nil unless token.present?
    "/#{token}"
  end

  def token
    params[:token]
  end

  def track_visit
    ahoy.track_visit
  end
end
