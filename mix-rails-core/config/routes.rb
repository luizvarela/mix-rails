Rails.application.routes.draw do
  match "system/uploads/*path" => "gridfs#serve"
end