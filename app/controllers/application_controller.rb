class ApplicationController < ActionController::Base
  def blank
    render 'blank'
  end

  def create
    Link.create!(link_params)
  end

  def fetch
    link = Link.find_by!(token: params[:token])
    redirect_to link.url
  end

  private

  def link_params
    params.permit(:token, :url)
  end
end
