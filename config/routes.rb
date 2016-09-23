Rails.application.routes.draw do

  root "postings#index"

  devise_for :users

  authenticated :users do
    resources :submitals
  end


  resources :postings do
    resources :submitals, except: :index

  end


  resources :users do
    resources :submitals, :postings
  end




end
