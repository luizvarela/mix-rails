class MixController < ActionController::Base

  before_filter -> {
    ActionMailer::Base.default_url_options[:host] = request.host_with_port 
    ActionMailer::Base.default_url_options[:script_name] = env['RAILS_RELATIVE_URL_ROOT']
  }

  helper :all

end