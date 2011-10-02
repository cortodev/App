class Inscrit < ActiveRecord::Base
  attr_accessible :name, :email

  validates_presence_of :name, :email
end
