Rails.application.routes.draw do
  
  localized do
    resources :board_messages
  end
    
  scope Admix::namespace_path, as: :admix, module: :admix do
    resources :board_messages do
      
      resources :board_replies

      member do
        put "approve"
        put "disapprove"
      end

    end
  end

end
