module Admix
  class AdmixController < MixController

    before_filter :authenticate_user!, :add_initial_breadcrumbs, :globals

    protected

    def add_initial_breadcrumbs
      breadcrumbs.add t('admix.dashboard'), admix_root_path, :id => 'dashboard', :title => 'Go to the home page'
    end

    def globals
      @controller = params[:controller]
    end

  end
end