class Commentaire < ActiveRecord::Base
  belongs_to :post

  attr_accessible :nom, :email, :contenu, :visible
  validates_presence_of :email, :contenu

  def visible?
    self.visible
  end
end
