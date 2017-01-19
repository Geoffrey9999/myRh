class InstancesController < ApplicationController
  before_action :require_session

  private

  def require_session
    unless session[:user_id].present?
      flash[:notice] = "Bien essayé Florent"
      redirect_to :controller => 'welcome', :action => 'connection', :error => flash[:notice]
    end
  end

  def index
    # if session[:user_id].present?
      render 'index'
    # else
    #   flash[:notice] = "Bien essayé Florent"
    #   redirect_to :controller => 'welcome', :action => 'connection', :error => flash[:notice]
    # end
  end

  def new
    # if session[:user_id].present?
      @company = Companie.all
      render 'new'
    # else
    #   flash[:notice] = "Bien essayé Florent"
    #   redirect_to :controller => 'welcome', :action => 'connection', :error => flash[:notice]
    end
  end

  def create

    if session[:user_id].present?
      year = params[:inst].permit(:model_year)[:model_year]
      month = params[:inst].permit(:model_mounth)[:model_mounth]
      date = year + " " + month
      id_entreprise = params[:entreprise]
      town = params[:inst].permit(:ville)[:ville]
      company_name = Companie.where(id: id_entreprise)
      Instance.create(town: town, company: company_name[0][:company_name], date: date , id_instance: id_entreprise)
      redirect_to :controller => 'instances', :action => 'index'
    else
      flash[:notice] = "Bien essayé Florent"
      redirect_to :controller => 'welcome', :action => 'connection', :error => flash[:notice]
    end
  end



end