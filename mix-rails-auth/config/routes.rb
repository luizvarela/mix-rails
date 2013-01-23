Rails.application.routes.draw do

  devise_for :users

  scope Admix::namespace_path, as: :admix, module: :admix do
    resources :users
  end

end
