# frozen_string_literal: true

Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'homes/top'
  devise_for :users
  resources :users

  resources :recipes do
    resources :reviews, only: [:new, :create, :destroy] do
      resources :review_replays, only: [:new, :create, :destroy]
    end
    resource :favorites, only:[:create, :destroy]
  end

  resources :shops

  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
