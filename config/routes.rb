Rails.application.routes.draw do
    get 'events/create'
    get    '/login' , to: 'sessions#new'    , as: 'login'
    delete '/logout', to: 'sessions#destroy', as: 'logout'

    root to: 'sessions#test'
    resources :sessions
    
    resources :events, only: [:create, :new, :index]
end
