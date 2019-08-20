Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resource :sessions, only: [:create, :destroy]

  get '/current_user', to: 'users#current'
end
