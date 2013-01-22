Rails.application.routes.draw do

  localized do
    resources :news
  end


  resources :blogs do
    resources :posts
  end

  namespace :admix do
    resources :news
    resources :blogs do
      resources :posts
    end
  end

end
