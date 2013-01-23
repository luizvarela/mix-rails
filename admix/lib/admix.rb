require "admix/engine"
require 'admix/navigation/menu'
require 'admix/navigation/navbar'


require 'will_paginate'
require 'will_paginate/array'
require 'datagrid'
require 'admix/table-actions'
require 'simple-navigation'
require 'simple-navigation-bootstrap'
require 'inherited_resources'
require 'formtastic'
require 'formtastic-bootstrap'
require 'jquery-rails'
require 'jquery-ui-rails'

require 'mix-rails-auth'


module Admix

  mattr_accessor :menus_container, :namespace_path

  self.menus_container = []

  self.namespace_path = 'admix'


  module Navigation
  end
end
