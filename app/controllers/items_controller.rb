class ItemsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.name = params[:item][:name]
    @item.date = params[:item][:date]
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

end
