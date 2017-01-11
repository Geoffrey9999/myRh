class UsersController < ApplicationController

  def new
  end

  def create
    @users = User.new(params.require(:users).permit(:firstname, :lastname, :birthdate , :mail))
    @users.save
    # render plain: params[:users].inspect
  end

end
