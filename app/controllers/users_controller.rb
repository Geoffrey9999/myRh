class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  def index
    @instance = Instance.all
  end

  def show
    # render plain: params[:id].inspect
    @id_instance = params[:id]
  end

  def instance
    @id_instance = params[:instance_id]
    render plain: @id_instance.inspect
  end

  def create
    @users = User.new(params.require(:users).permit(:firstname, :lastname, :birthdate , :mail, :id_instance))
    @users.save
    flash[:notice] = 'Successfully checked in'
    redirect_to :controller => 'welcome', :action => 'connection'
     
    # render plain: params[:users].inspect
  end

end
