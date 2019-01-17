Rails.application.routes.draw do
    get    '/login' ,   to: 'sessions#new',     as: 'login'
    delete '/logout',   to: 'sessions#destroy', as: 'logout'

    scope '/admin' do
        get '/alumni-statistics',   to: 'administrators#alumni_statistics'
        get '/alumni-list',         to: 'administrators#alumni_list'
        get '/alumnus-record/:id',  to: 'administrators#show_alumnus_record', as: 'show_alumnus_record'
    end

    scope '/users' do
        get     '/register',    to: 'users#new',       as: 'new_users'
        post    '/create',      to: 'users#create',    as: 'create_user'
    end

    root to: 'sessions#new'
    resources :sessions
    
    resources :events, only: [:create, :new, :index]
end
