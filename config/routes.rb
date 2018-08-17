Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/:token', to: 'links#fetch'

  post '/4dmin/links/new', to: 'admin/links#create'
  get  '/4dmin/links/new', to: 'admin/links#new'
  get  '/4dmin/links', to: 'admin/links#index'
  get  '/4dmin/links/:token', to: 'admin/links#show'
end
