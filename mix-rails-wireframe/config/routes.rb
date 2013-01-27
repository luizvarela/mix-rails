Rails.application.routes.draw do

  root to: "wireframe#index"

  match '/home' => "wireframe#home", as: 'home'

end
