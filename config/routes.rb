Rails.application.routes.draw do
  root 'orders#index'
  get '/orders', to: 'orders#index'
  get '/orders/upload', to: 'orders#upload'
  get '/orders/:id', to: 'orders#show'
  post '/orders/store_from_file', to: 'orders#store_from_file'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
