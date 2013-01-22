class Admix::UsersController < Admix::InheritedController

  protected
  def crumb_field
    "email"
  end
  
end