class Post < ActiveRecord::Base
  belongs_to :user
  has_many :commentaires

  before_create :set_count

  attr_accessible :titre, :contenu, :image, :son, :user_id

  validates_presence_of :titre, :contenu

  def set_count
    self.count = 0
  end

  mount_uploader :image, ImageUploader
  mount_uploader :son, SonUploader
end
