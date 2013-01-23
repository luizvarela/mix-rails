Rails.application.routes.draw do

    scope Admix::namespace_path, as: :admix, module: :admix do
      match 'upload' => 'nicedit#upload'
      root to: 'dashboard#index'
    end



end