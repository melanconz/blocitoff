class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @list = @user.lists
  end

end
