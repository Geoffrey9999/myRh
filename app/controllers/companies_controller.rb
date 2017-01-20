class CompaniesController < ApplicationController

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
  end

  def create
    enterprise = params[:companie].permit(:company)[:company]
    town = params[:companie].permit(:town)[:town]
    Companie.create(company_name: enterprise, company_location: town)
    flash[:notice] = "Nouvelle entreprise crée"
    render 'index'
  end

  def show_company
    @companys = Companie.all
  end

  def edit
    @find = Companie.where(id: params[:id])
    @id = @find[0]
  end

  def update
    set_name = params[:name]
    set_place = params[:town]
    update = Companie.where(id: params[:id])
    update.update(company_name: set_name, company_location: set_place)
    flash[:notice] = "Entreprise bien modifié, merci"
    render 'index'
  end

  def display
    @company = Companie.all
  end

  def show
    @id = Companie.where(id:params[:id])
  end

  def destroy
    Companie.destroy(params[:id])
    flash[:notice] = "Entreprise Supprimer"
    render 'index'
  end


end
