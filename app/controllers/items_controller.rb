class ItemsController < ApplicationController


  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(post_params)
    @item.user = current_user
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to [@item.user]
    else
      flash[:error] = "There was an error when saving item. Please try again."
      redirect_to [@item.user]
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
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

  def item_params
    params.require(:item).permit(:name)
  end

end
