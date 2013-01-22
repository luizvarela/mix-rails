Rails.application.routes.draw do
  namespace :admix do
    resources :settings
  end
end
