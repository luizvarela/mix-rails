Rails.application.routes.draw do

  localized do
    resources :songs do 
      collection do
        get :player
      end
    end
  end

  scope Admix::namespace_path, as: :admix, module: :admix do
    resources :songs
  end

end
