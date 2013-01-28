Rails.application.routes.draw do
  
  localized do
    resources :albums
  end
    
  scope Admix::namespace_path, as: :admix, module: :admix do
    resources :albums do
      resources :photos do
        member do
          get :edit_ajax
          post :update_description
        end
      end
    end
  end

end
