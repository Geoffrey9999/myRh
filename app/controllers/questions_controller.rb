class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @id = params[:id]
  end

  # GET /questions/new
  def new
    @question = Question.new
    @instance = Instance.all
  end

  # GET /questions/1/edit
  def edit
    @instance = Instance.all
  end

  # POST /questions
  # POST /questions.json
  def create
    @instance = Instance.all
    value = params[:questions].permit(:template)['template']
    set_name = params[:name]
    set_instance = params[:instance]
    @question = Question.new(template: value, name: set_name, instance_id: set_instance)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    value = params[:questions].permit(:template)['template']
    set_name = params[:name]
    set_instance = params[:instance]
    respond_to do |format|
      if @question.update(template: value, name: set_name, instance_id: set_instance)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    Question.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.fetch(:question, {})
  end
end
