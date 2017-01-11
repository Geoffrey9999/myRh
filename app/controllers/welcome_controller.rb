class WelcomeController < ApplicationController
  def index
  end

  def connection
  end

  def register
  end

  def create
    render plain: params[:user].inspect
  end

end
