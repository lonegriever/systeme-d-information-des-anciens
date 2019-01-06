Rails.application.routes.draw do
    root to: 'sessions#test'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :sessions
    
    get 'admin/home',   to: 'admins#home', as: 'admin_home'
end
