Rails.application.routes.draw do
  get 'events/create'
    root to: 'sessions#test'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :sessions
    
    resources :events, only: [:create, :new]
end
