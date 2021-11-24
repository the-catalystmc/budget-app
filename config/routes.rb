Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "application#index"

  resources :reports
  resources :groups

  get '/non_authorized', to: 'application#non_authorized'
end
