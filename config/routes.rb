Rails.application.routes.draw do
  #resources :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :regions do
    resources :groups do
      resources :members
    end
  end

  root 'regions#index'

end
