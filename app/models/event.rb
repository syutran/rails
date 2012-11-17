class Event < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :description, :is_public, :name
end
