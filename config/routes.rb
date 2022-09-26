Rails.application.routes.draw do
  namespace :admin do
      resources :roles
      resources :jobs
      resources :users

      root to: "roles#index"
    end
devise_for :users  
# devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # get 'welcome/index'
  # match ‘/send_mail’, to: 'welcome#send_mail', via: “get”
  # devise_for :users, controllers: { sessions: 'users/sessions' }


  resources :jobs
  root 'welcome#index'
  # resources jobs

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
