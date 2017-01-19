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
    company_name = Companie.where(id: id_entreprise)
    name = company_name[0][:company_name]
   Instance.create(company: name, date: date)
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
    set_company = params[:company]
    update = Instance.where(id: params[:id])
    update.update(date: set_date, company: set_company)
    flash[:notice] = "Instance bien modifié, merci"
      render 'index'
  end

end