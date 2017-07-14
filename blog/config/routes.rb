Rails.application.routes.draw do
  get 'welcome/index'
resources :sessions, only: [:create, :new, :destroy]
resources :users do
  resources :articles do
    resources :comments
  end
end
root 'welcome#index'

end
