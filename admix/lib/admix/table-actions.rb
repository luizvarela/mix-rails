module Admix
  module TableActions
    extend ActiveSupport::Concern

    included do
      column(
        :actions,
        header: I18n.t('admix.crud.actions'),
        html: true
      ) do |resource|
        render :partial => "table_actions", :locals => {:resource => resource}
      end
    end

  end
end

