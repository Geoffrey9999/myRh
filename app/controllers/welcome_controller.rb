class WelcomeController < ApplicationController
  def index
  end

  def administration
  end

  def connection
  end

  def register
  end

  def create
    @new_user = User.new(user_params)
    @new_user.save
  end

end
