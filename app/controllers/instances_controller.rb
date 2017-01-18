class InstancesController < ApplicationController

  def index
    if session[:user_id].present?
      render 'index'
    else
      flash[:notice] = "Bien essayé Florent"
      redirect_to :controller => 'welcome', :action => 'connection', :error => flash[:notice]
    end
  end

  def new
    if session[:user_id].present?
      render 'new'
    else
      flash[:notice] = "Bien essayé Florent"
      redirect_to :controller => 'welcome', :action => 'connection', :error => flash[:notice]
    end
  end

  def create
    if session[:user_id].present?
      year = params[:inst].permit(:model_year)[:model_year]
      month = params[:inst].permit(:model_mounth)[:model_mounth]
      date = year + " " + month
      entreprise = params[:entreprise]
      town = params[:ville]
      Instance.create(town: town, company: entreprise, date: date)
    else
      flash[:notice] = "Bien essayé Florent"
      redirect_to :controller => 'welcome', :action => 'connection', :error => flash[:notice]
    end
  end

end
