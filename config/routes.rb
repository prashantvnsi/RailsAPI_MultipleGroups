Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  #resources :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users

  resources :regions do
    resources :groups do
      resources :members
    end
  end

  root 'regions#index'

end
