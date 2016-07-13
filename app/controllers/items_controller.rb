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

  private

  def items_params
    params.require(:item).permit(:description)
  end
end
