Rails.application.routes.draw do

  root "postings#index"

  devise_for :users

  authenticate :user do
    resources :submital, only: [:create]
  end
  resources :submital, only: [:create]

  resources :postings do
    resources :submitals, except: :index

  end


  resources :users do
    resources :submitals, :postings
  end




end
