Rails.application.routes.draw do
  
  localized do
    resources :albums
  end
    
  namespace :admix do
    resources :albums do
      resources :photos
    end
  end

end
