class ListsController < ApplicationController
  before_action :authentication_required

  def index
    #if you are not logged in, you can't see this page, in fact, go back to the login page
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
    @item = Item.new
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
