Rails.application.routes.draw do

  localized do
    resources :songs do 
      collection do
        get :player
      end
    end
  end

  namespace :admix do
    resources :songs
  end

end
