Rails.application.routes.draw do
  match "files/uploads/*path" => "gridfs#serve"
end