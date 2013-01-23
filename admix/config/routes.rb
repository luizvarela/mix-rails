Rails.application.routes.draw do

    devise_for :admix_users, class_name: 'User', path: Admix::namespace_path, controllers: { sessions: 'admix/sessions', passwords: 'admix/passwords' },
             path_names: { :sign_in => 'login', :sign_out => 'logout' }


    scope Admix::namespace_path, as: :admix, module: :admix do
      match 'upload' => 'nicedit#upload'
      root to: 'dashboard#index'
    end

end