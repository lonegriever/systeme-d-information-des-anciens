Rails.application.routes.draw do
    get    '/login' ,   to: 'sessions#new'    ,           as: 'login'
    delete '/logout',   to: 'sessions#destroy',           as: 'logout'

    get '/alumni-list', to: 'administrators#alumni_list', as: 'alumni-list'

    root to: 'sessions#test'
    resources :sessions
    
    resources :events, only: [:create, :new, :index]
end
