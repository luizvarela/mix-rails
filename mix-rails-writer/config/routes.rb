Rails.application.routes.draw do

  localized do
    resources :news
  end


  resources :blogs do
    resources :posts
  end

  scope Admix::namespace_path, as: :admix, module: :admix do
    resources :news
    resources :blogs do
      resources :posts
    end
  end

end
