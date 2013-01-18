class AdmixMailer < ActionMailer::Base
  
  add_template_helper(ApplicationHelper)

  default from: Setting.app_email
  
end
