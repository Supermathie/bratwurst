Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sso
  get '/login', to: "login#index"
  get '/sso_login', to: "sso_login#index"
end
