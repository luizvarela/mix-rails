class Category
  include Mongoid::Document

  field :name
  field :description

  validates_presence_of :name

end