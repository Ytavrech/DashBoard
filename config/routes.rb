Rails.application.routes.draw do
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # namespace :admin do
  #     resources :roles
  #     resources :jobs
  #     resources :users

  #     root to: "roles#index"
  #   end
 devise_for :users do
  get '/users/sign_out' => 'devise/sessions#destroy'
 end
 #, class_name: 'Blast::User', module: :devise
# devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # get 'welcome/index'
  # match ‘/send_mail’, to: 'welcome#send_mail', via: “get”
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  
  resources :home
  resources :jobs do
    resources :applicants
    get :jobpost
    get :home
    patch :accept
    patch :decline
  end


  root 'welcome#index'
  # resources jobs

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"



end
