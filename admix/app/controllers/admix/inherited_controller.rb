module Admix
  class InheritedController < Admix::AdmixController

    inherit_resources

    load_and_authorize_resource

    helper :all

    before_filter :generate_datagrid , only: [:index ]

    
    # Add a breadcrumb, in this case nested resources. ;) by: sadjow@gmail.com
    before_filter -> {
      if defined?(parent_type)
        breadcrumbs.add t("#{parent_type.to_s.gsub('_', '').pluralize}.#{parent_type.to_s.gsub('_', '').pluralize}") , polymorphic_path([:admix,parent_class])
        breadcrumbs.add "#{parent.name}" , parent_url
      end
    }

    before_filter -> { breadcrumbs.add t("#{collection_name}.#{collection_name}"), collection_url, :i18n => false }
    before_filter -> { breadcrumbs.add "#{resource[crumb_field]}" , resource_url, :i18n => false } , except: [:index, :new, :create ]
    before_filter -> { breadcrumbs.add t("admix.crud.new.title"), :i18n => false } , only: [:new ]
    before_filter -> { @crumb_field = crumb_field } , only: [:edit ]

    def initialize(datagrid_class = nil)
      super()
      @datagrid_class = guess_datagrid_class unless datagrid_class
    end

    protected

    def crumb_field
      if resource.respond_to?(:name)
        :name
      elsif resource.respond_to?(:title)
        :title
      elsif resource.respond_to?(:email)
        :email
      else
        "Implement crumb_field method in #{self}"
      end
    end

    def collection_name
      resource_class.to_s.downcase.pluralize
    end

    def resource_name
      resource_class.to_s.downcase
    end

    def form_fields
      raise "TODO: We need implement this in #{self}"
    end

    def generate_datagrid
      @report = report
      @assets = @report.assets.paginate(:page => params[:page], :per_page => 10)
    end

    def report
      @datagrid_class.new(params[datagrid_param_name])
    end

    private
    def guess_datagrid_class
      "#{self.class.name}".gsub("Controller", "Datagrid").constantize
    end

    def datagrid_param_name
      guess_datagrid_class.to_s.underscore.gsub('/', '_')
    end


  end
end
