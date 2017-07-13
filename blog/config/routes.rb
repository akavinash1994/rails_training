Rails.application.routes.draw do
  get 'welcome/index'

  resources :users do
  	resources :articles do
  		resources :comments
  	end
  end
  root 'welcome#index'
  get 'sessions/login', to: 'sessions#login'
  post 'sessions/login_attempt', to: 'sessions#login_attempt'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
