Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace '4dmin' do
    get '/:token', to: 'admin#info'
  end

  get '/:token', to: 'application#fetch'
  post '/', to: 'application#create'
  get '/', to: 'application#blank'
end
