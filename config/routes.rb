# frozen_string_literal: true

Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'homes/top'
  devise_for :users
  resources :users do
    member do
      get :delete
      post :delete
    end
  end
  resources :recipes do
    resources :favorites, only: %i[create destroy]
  end
  resources :shops do
    resources :reviews, only: %i[create destroy]
  end

  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
