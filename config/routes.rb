Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists
  root 'lists#index'

  resources :lists do
    member do
      post :is_public
      patch :complete
    end
  end
end
