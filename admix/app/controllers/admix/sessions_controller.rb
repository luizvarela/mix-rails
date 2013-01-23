class Admix::SessionsController < Devise::SessionsController
    
    layout 'admix/login'

    def after_sign_in_path_for(resource)
      request.env['omniauth.origin'] || session[:admix_user_return_to] || admix_root_path
    end

end
