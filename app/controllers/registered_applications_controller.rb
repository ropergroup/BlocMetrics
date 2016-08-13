class RegisteredApplicationsController < ApplicationController


  def create

      @registered_applications = RegisteredApplication.new
      @registered_applications.appname = params[:registered_applications][:appname]
      @registered_applications.url = params[:registered_applications][:url]

      if @registered_applications.save

        flash[:notice] = "Application was saved successfully."
        redirect_to @registered_applications
      else

        flash.now[:alert] = "There was an error saving the application. Please try again."
        render :new
      end
  end

  end

  def edit
    @registered_applications = RegisteredApplication.find(params[:id])
  end

  def update
     @registered_applications = RegisteredApplication.find(params[:id])
     @registered_applications.title = params[:registered_applications][:appname]
     @registered_applications.body = params[:registered_applications][:url]

     if @registered_applications.save
       flash[:notice] = "The application was updated successfully."
       redirect_to @registered_applications
     else
       flash.now[:alert] = "There was an error saving the application. Please try again."
       render :edit
     end
   end

  def destroy
      @user = current_user
      @registered_applications = @user.registered_applications.find(params[:id])

    if @registered_applications.destroy
      flash[:notice] = "The application has been completed!"
    else
      flash[:alert] = "There was an error deleting the application. Try again."
    end

      respond_to do |format|
        format.html
        format.js
      end
  end

end
