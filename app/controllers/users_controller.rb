class UsersController < ApplicationController

  def index
    @instance = Instance.all
    flash[:notice] = params[:error]
  end

  def show
    @id_instance = Instance.find_by_id(params[:id])
    if @id_instance.present?
      @value = params[:id]
    else
      flash[:notice] = 'Bien Essayé'
      redirect_to :controller => 'users', :action => 'index', :error => flash[:notice]
    end
  end

  def create

    @check_instance = Instance.find_by_id(params[:users].permit(:id_instance)[:id_instance])
    if @check_instance.present?
      @users = User.new(params.require(:users).permit(:firstname, :lastname, :birthdate , :mail, :id_instance))
      @users.save
      flash[:notice] = 'Successfully checked in'
      redirect_to :controller => 'welcome', :action => 'connection'
    else
      flash[:notice] = 'Bien Essayé'
      redirect_to :controller => 'users', :action => 'index', :error => flash[:notice]
    end
    # render plain: params[:users].inspect
  end

end
