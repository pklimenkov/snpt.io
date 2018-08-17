class LinksController < ApplicationController
  before_action :track_visit

  def fetch
    link = Link.find_by!(token: token)
    redirect_to link.url
  end
end
