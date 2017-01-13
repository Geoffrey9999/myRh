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
    @check_user = User.find_by(mail: params[:users].permit(:mail)[:mail])

    if @check_user.present?
      flash[:notice] = 'Le mail est déjà utilisé'
      redirect_to :controller => 'users', :action => 'index', :error => flash[:notice]
    elsif @check_instance.nil?
      flash[:notice] = 'Bien essayé'
      redirect_to :controller => 'users', :action => 'index', :error => flash[:notice]
    else
      @users = User.new(params.require(:users).permit(:firstname, :lastname, :birthdate , :mail, :id_instance))
      @users.save
      flash[:notice] = 'Inscription réussit'
      redirect_to :controller => 'welcome', :action => 'connection'
    end
  end

end



# render plain: params[:users].inspect
