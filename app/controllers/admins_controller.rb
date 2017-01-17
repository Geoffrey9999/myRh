class AdminsController < ApplicationController

  def index
    if session[:user_id].present?
    else
      redirect_to :controller => 'welcome', :action => 'connection'
    end
  end

  def new
  end

end
