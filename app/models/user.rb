class User < ActiveRecord::Base
  POLES = %w[buro anim RP comm]
  ROLES = %w[doadmin doauteur modoateur]
  has_many :posts
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :image, :roles, :poles, :description

  scope :with_pole, lambda{ |pole| {:conditions => "poles_mask & #{2**POLES.index(poles.to_s)} > 0" }}
  scope :with_role, lambda{ |role| {:conditions => "roles_mask & #{2**ROLES.index(roles.to_s)} > 0" }}

  def poles=(poles)
    self.poles_mask = (poles & POLES).map{ |p| 2**POLES.index(p) }.sum
  end

  def poles
    POLES.reject{ |p| ((poles_mask || 0) & 2**POLES.index(p)).zero? }
  end

  def pole?(p)
    poles.include? p.to_s
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map{ |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject{ |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role?(r)
    roles.include? r.to_s
  end

  mount_uploader :image, ImageUploader
end
