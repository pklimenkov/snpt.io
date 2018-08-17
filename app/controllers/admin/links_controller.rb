module Admin
  class LinksController < ApplicationController
    http_basic_authenticate_with name: 'snpt', password: '7kFx84waTE'

    def new
      render 'new'
    end

    def create
      Link.create!(link_params)
    end

    private

    def link_params
      params.permit(:token, :url)
    end
  end
end
