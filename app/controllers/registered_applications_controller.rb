class RegisteredApplicationsController < ApplicationController

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @user = current_user
    @registered_application = RegisteredApplication.new
  end

  def create
    @user = current_user
    @registered_application = @user.registered_applications.create(registered_application_params)
    if @registered_application.save
      flash[:notice] = "Your site was saved successfully."
      redirect_to user_registered_application_path(@user, @registered_application)
    else
      flash.now[:alert] = "There was an error. Please try again.."
      render :new
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
     @registered_application = RegisteredApplication.find(params[:id])
     @registered_application.title = params[:registered_application][:appname]
     @registered_application.body = params[:registered_application][:url]

     if @registered_application.save
       flash[:notice] = "The application was updated successfully."
       redirect_to @registered_application
     else
       flash.now[:alert] = "There was an error saving the application. Please try again."
       render :edit
     end
   end

   def destroy
    @user = current_user
    @registered_application = @user.registered_applications.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "The application has been completed!"
      redirect_to root_path(@user, @registered_application)
    else
      flash[:alert] = "There was an error deleting the application. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def registered_application_params
    params.require(:registered_application).permit(:appname, :url)
  end

end
