Rails.application.routes.draw do

  devise_for :users, sign_out_via: 'get'

  scope Admix::namespace_path, as: :admix, module: :admix do
    devise_for :users, sign_out_via: 'get', controllers: {sessions: 'admix/sessions', passwords: 'admix/passwords'}, :path_names => { :sign_in => 'login', :sign_out => 'logout' }
    resources :users
    resources :roles
  end

end
