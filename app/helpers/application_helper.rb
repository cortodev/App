module ApplicationHelper
  def resource_name
    :user
  end

  def resourec
    @resource ||= User.nex
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
