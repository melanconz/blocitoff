class ListsController < ApplicationController

  def show
    @list = List.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @list = List.new
  end

  def create
    @user = User.find(params[:user_id])
    @list = List.new(list_params)
    @list.name = params[:list][:name]
    @list.user = current_user

    if @list.save
      flash[:notice] = "List category was saved."
      redirect_to [@user]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def update
    @list = List.find(params[:id])
    @list.name = params[:list][:name]
    @list.assign_attributes(list_params)

    if @list.save
      flash[:notice] = "List was updated"
      redirect_to [@list.user]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @list = List.find(params[:id])
    @list.user = current_user

    if @list.destroy
      flash[:notice] = "\"#{@list.name}\" was deleted successfully."
      redirect_to [@list.user]
    else
      flash[:error] = "There was an error deleting the list"
      render :show
    end
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
