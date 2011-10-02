class UsersController < ApplicationController

  def index
    @users = User.all

    respond_to do |format|
      format.html { render 'index'}
    end
  end

  def poles
    @users = User.all

    respond_to do |format|
      format.html { render 'poles' }
    end
  end

end
