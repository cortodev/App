class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Vous avez cherché à atteindre un e page inexistante et vous avez été redirigé vers la page d'acceuil"
    redirect_to root_url
  end
end
