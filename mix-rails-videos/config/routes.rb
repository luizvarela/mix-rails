Rails.application.routes.draw do
  resources :videos, only: [:index, :show]

  namespace :admix do
    resources :videos
  end
end
