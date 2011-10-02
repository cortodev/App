class Newsletter < ActiveRecord::Base
  attr_accessible :contenu

  validates_presence_of :contenu
end
