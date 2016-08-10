class RegisteredApplicationsController < ApplicationController

  def index

    @registered_applications =RegisteredApplication.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
  end

end
