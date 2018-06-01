class ItemsController < ApplicationController
  include Accessible
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def show
    @items = Item.all
  end

  def new
    @item = Item.new
    # @line_item = LineItem.new
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

  def sort_by_item_type
    render text: "Hello World"
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_type, 
                                 :price, :description,
                                 :image, :active)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
