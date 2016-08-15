class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(items_params)
    if @item.save
      redirect_to list_path(@list)
    else
      render '/lists/show'
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(items_params)

    redirect_to list_path(@item.list)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to list_path(@item.list)
  end



  private

  def items_params
    params.require(:item).permit(:description, :status)
  end
end
