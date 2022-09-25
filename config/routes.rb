Rails.application.routes.draw do
devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # get 'welcome/index'
  # match ‘/send_mail’, to: 'welcome#send_mail', via: “get”


  resources :jobs
  root 'welcome#index'
  # resources jobs

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
