Rails.application.routes.draw do
    
    get    '/login' ,   to: 'sessions#new',     as: 'login'
    delete '/logout',   to: 'sessions#destroy', as: 'logout'
    get    '/about',    to: 'static_pages#about'

    scope '/admin' do
        get '/alumni-statistics',                    to: 'administrators#alumni_statistics'
        get '/alumni-list',                          to: 'administrators#alumni_list'
        get '/alumnus-record/:id',                   to: 'administrators#show_alumnus_record', as: 'show_alumnus_record'
        get '/alumnus-record-notif/:id/:notification_id',  to: 'administrators#show_alumnus_record'
    end

    scope '/users' do
        get     '/register',        to: 'users#new',       as: 'new_users'
        post    '/create',          to: 'users#create',    as: 'create_user'
        get     '/create',          to: 'users#new'
        get     '/edit/:user_id',   to: 'users#edit',      as: 'user_edit'
        post    '/update',          to: 'users#update',     as: 'update_user'
    end

    namespace :api do
        scope '/admin' do
            get '/get-alumni-statistics', to: 'charts_data#get_alumni_statistics'
            get '/get-employed-count',    to: 'charts_data#get_employed_count'
            get '/get-notifications',     to: 'notifications#retrieve_all'
        end

        scope '/user' do
            get '/get-notifications',     to: 'notifications#retrieve_all'
        end
    end

    root to: 'sessions#new'
    resources :sessions
    
    resources :events, only: [:create, :new, :index] do 
        get '/events/:notification_id', to: 'notifications#index'
    end

    mount ActionCable.server, at: '/cable'
end
