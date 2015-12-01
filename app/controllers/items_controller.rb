class ItemsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.name = params[:item][:name]
    @user = User.find(params[:user_id])
    @item.user = @user

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to [@user, @item]
    else
      flash[:error] = "There was an error when saving item. Please try again."
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item completed. Good job!"
    else
      flash[:error] = "Item could not be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

end
