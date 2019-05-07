Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users
  resources :users do
    member do
      get :delete
      post :delete
    end
  end
  resources :recipes do
      resources :favorites, only:[:create, :destroy]
  end
  resources :shops do
      resources :reviews, only:[:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
