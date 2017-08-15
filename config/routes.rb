Rails.application.routes.draw do

  root 'events#index'
  devise_for :organizers, path_names: {
    sign_in: 'login', sign_out: 'logout'
  }
  resources :events, only: [:index, :show]
  get '/past', to: 'events#past', as: :past
  get '/upcoming', to: 'events#upcoming', as: :upcoming
  resources :organizers, only: [:show, :index]

  namespace :admin do
    resources :organizers, only: [:edit, :update]
    resources :events, only: [:index, :new, :create, :edit, :update]
    get '/events', to: 'events#index', as: :organizer_root
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
