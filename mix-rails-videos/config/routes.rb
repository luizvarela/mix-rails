Rails.application.routes.draw do
  resources :videos, only: [:index, :show]

  scope Admix::namespace_path, as: :admix, module: :admix do
    resources :videos
  end
end
