class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_type, :price, :description, :image, :active)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
