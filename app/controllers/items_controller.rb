class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_type, :price, :description, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
