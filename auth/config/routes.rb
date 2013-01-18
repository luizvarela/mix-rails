Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'admix/sessions', passwords: 'admix/passwords' },
             path_names: { :sign_in => 'login', :sign_out => 'logout' }


  namespace :admix do
    resources :users
  end

end
