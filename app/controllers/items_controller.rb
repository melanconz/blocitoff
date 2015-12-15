class ItemsController < ApplicationController

  def show
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(item_params)
    @item.name = params[:item][:name]
    @item.user = current_user


    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to [current_user]
    else
      flash[:error] = "There was an error when saving item. Please try again."
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.name = params[:item][:name]
    @item.assign_attributes(item_params)

    if @item.save
      flash[:notice] = "Item was updated."
      redirect_to [@item.list, @item]
    else
      flash[:error] = "There was an error saving the item. Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])

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

  def item_params
    params.require(:item).permit(:name)
  end

end
