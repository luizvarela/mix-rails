module Admix
  class AdmixController < MixController

    before_filter :authenticate_admix_user!, :add_initial_breadcrumbs, :globals

    def current_user
      current_admix_user
    end

    protected
    def add_initial_breadcrumbs
      breadcrumbs.add t('admix.dashboard'), admix_root_path, :id => 'dashboard', :title => 'Go to the home page'
    end

    def globals
      @controller = params[:controller]
    end

  end
end