class AdminsController < ApplicationController

  def index
    if session[:user_id].present?
    else
      redirect_to :controller => 'welcome', :action => 'connection'
    end
  end

  def new
  end

  def create
    tmp_array = []
    if params[:select].present?
      quest = params[:quest]
      select =  params[:select]
      render plain: quest.inspect
      tmp_array.push(quest)
      # tmp_array.push(select)
      Question.create(questions: tmp_array)
      # redirect_to :controller => 'admins', :action => 'new', :error => flash[:notice]
    end
  end
end
