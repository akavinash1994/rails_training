Rails.application.routes.draw do
  get 'welcome/index'

  resources :users do
  	resources :articles do
  		resources :comments
  	end
  end
  root 'welcome#index'
  get 'sessions/login', to: 'sessions#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
