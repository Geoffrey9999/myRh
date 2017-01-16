class UsersController < ApplicationController

  def index
    @instance = Instance.all
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
    @id = params[:users].permit(:id_instance)[:id_instance]

    if @check_instance.nil?
      flash[:notice] = 'Bien essayé'
      redirect_to :controller => 'users', :action => 'index', :error => flash[:notice]
    else
      @user = User.new(params.require(:users).permit(:firstname, :lastname, :birthdate , :mail, :id_instance))
      if @user.valid?
        @user.save
        flash[:notice] = 'Inscription réussite'
        redirect_to :controller => 'welcome', :action => 'connection'
      else
        # render plain: params[:users].permit(:id_instance)[:id_instance].inspect
        # redirect_to :action => "show", :id => @id, :users => @user
        render 'show'
      end
    end
  end

end

# render plain: params[:users].inspect
