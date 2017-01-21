class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :session_admin

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.where(id: params[:id])
    @id = params[:id]
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @password = SecureRandom.hex(5)

    @login = params[:admin].permit(:login)[:login]
    @mail = params[:admin].permit(:mail)[:mail]
    @firstname = params[:admin].permit(:firstname)[:firstname]
    @lastname = params[:admin].permit(:lastname)[:lastname]

    @admin = Admin.new(login: @login, mail: @mail, firstname: @firstname, lastname: @lastname, password: @password)
    UserMailer.admin_mailer(@mail, @password, @firstname ).deliver_now

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    @login = params[:admin].permit(:login)[:login]
    @mail = params[:admin].permit(:mail)[:mail]
    @firstname = params[:admin].permit(:firstname)[:firstname]
    @lastname = params[:admin].permit(:lastname)[:lastname]

    respond_to do |format|
      if @admin.update(login: @login, mail: @mail, firstname: @firstname, lastname: @lastname)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    Admin.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.fetch(:admin, {})
  end

  def session_admin
    @session = session[:user_id]
    is_admin = Admin.where(id: @session)
    if is_admin[0]['is_admin'] != 1
      flash[:notice] = "héhéhé"
      redirect_to :controller => 'welcome', :action => 'index', :error => flash[:notice]
    end
  end
end
