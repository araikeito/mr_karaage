# frozen_string_literal: true

Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'homes/top'
  devise_for :users
  resources :users

  resources :recipes do
    resource :reviews, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end

  resources :shops

  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
