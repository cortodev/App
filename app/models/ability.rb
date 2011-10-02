class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role?(:doadmin)
      can :manage, :all
    else
      can :read, :all
      can :create, Commentaire
      can :update, Commentaire do |commentaire|
        commentaire.try(:user) == user || user.role?(:modoateur)
      end
      if user.role?(:doauteur)
        can :create, Post
        can :update, Post do |post|
          post.try(:user) == user
        end
      end
    end
  end
end
