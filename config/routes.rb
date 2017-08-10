Rails.application.routes.draw do

  get '/', to: 'events#index', as: :root
  resources :events
  get '/past', to: 'events#past', as: :past
  get '/upcoming', to: 'events#upcoming', as: :upcoming

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
