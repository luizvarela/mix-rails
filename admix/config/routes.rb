Rails.application.routes.draw do
  namespace :admix do
    match 'upload' => 'nicedit#upload'
    root to: 'dashboard#index'
  end
end
