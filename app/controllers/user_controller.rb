class UsersController < ApplicationController

  def show
    @user = current_user
    @registered_applications = @user.items
  end

end
