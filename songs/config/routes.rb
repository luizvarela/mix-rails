Rails.application.routes.draw do

  localized do
    resources :songs
  end
    
  namespace :admix do
    resources :songs
  end

end
