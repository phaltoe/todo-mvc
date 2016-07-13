class ListsController < ApplicationController

  def index
    @list = List.new
    @lists = List.all
  end

  def create
    @list = List.new(list_params)

    if @list.valid?
      @list.save
      redirect_to list_path(@list)
    else
      @lists = List.all
      render :index
    end
  end


  def show 
    @list = List.find(params[:id])
    @item = @list.items.build
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
