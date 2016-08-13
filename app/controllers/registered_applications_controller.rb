class RegisteredApplicationsController < ApplicationController


  def create
      @user = User.find(params[:user_id])
      @registered_application = @user.registered_applications.new(registered_application_params)
      @registered_application.user = current_user

      if @registered_application.save
        flash[:notice] = "Application saved successfully."
        redirect_to [@user]
      else
        flash[:alert] = "Application failed to save."
        redirect_to [@user]
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
      @registered_application = @user.registered_application.find(params[:id])

    if @registered_application.destroy
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
