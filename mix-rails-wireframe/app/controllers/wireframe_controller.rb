class WireframeController < MixController

  def index
    redirect_to home_path
  end

  def home
    breadcrumbs.add 'Inicial'
  end

end