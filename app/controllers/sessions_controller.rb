class SessionsController < ApplicationController

  def new
  end

  def create
    user = Admin.find_by(login: params[:session][:login].downcase)
    pass = Admin.find_by(password: params[:session][:password].downcase)
    if user.present? && pass.present?
      log_in user
      redirect_to :controller => 'welcome', :action => 'index'
    else
      flash[:notice] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    session[:user_id] = nil
    redirect_to :controller => 'welcome', :action => 'connection'
  end

end
