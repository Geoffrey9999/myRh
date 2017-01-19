class InstancesController < ApplicationController
  before_action :require_session

  def require_session
    unless session[:user_id].present?
      flash[:notice] = "Bien essayé Florent"
      redirect_to :controller => 'welcome', :action => 'connection', :error => flash[:notice]
    end
  end

  def index
  end

  def new
    @company = Companie.all
  end

  def create
    day = params[:inst].permit(:dateinstructed)['dateinstructed(3i)']
    month = params[:inst].permit(:dateinstructed)['dateinstructed(2i)']
    year = params[:inst].permit(:dateinstructed)['dateinstructed(1i)']
    date = day + '/' + month + '/' + year
    id_entreprise = params[:entreprise]
    set_town = params[:inst].permit(:ville)[:ville]
    company_name = Companie.where(id: id_entreprise)
    name = company_name[0][:company_name]
    new = Instance.new(town: set_town, company: name, date: date , id_instance: id_entreprise)
    new.save
    render 'index'
  end

  def get_instances
    @instances = Instance.all
  end

  def edit
    @company = Companie.all
    @get_instance = Instance.where(id: params[:id])
    @id = @get_instance[0]
  end

  def update
    set_date = params[:date]
    set_town = params[:town]
    set_company = params[:company]
    update = Instance.where(id: params[:id])
    update.update(date: set_date, town: set_town, company: set_company)
    flash[:notice] = "Instance bien modifié, merci"
    redirect_to :controller => 'instances', :action => 'index', :error => flash[:notice]
  end

end