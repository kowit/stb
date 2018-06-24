class LineItemsController < ApplicationController
  include CurrentCart
  before_action :authenticate_user!
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    # Find the current item_id, user_id
    @item = Item.find(params[:item_id])
    @current_user_id = current_user.id
    @item_name = @item.name
    @item_price = @item.price
    @item_type = @item.item_type

    # Create a new LineItem with the item and current_user ID params
    @line_item = @cart.add_item(@item, @current_user_id, @item_price,
                                @item_name, @item_type)

    @line_item.set_default_attributes

    respond_to do |format|
      if @line_item.save
        # format.html { redirect_to items_path, notice: 'Item added to cart' }
        format.html { redirect_to @line_item.cart, notice: 'Item added to cart.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @cart = Cart.find(session[:cart_id])

    respond_to do |format|
      if @line_item.update_attributes(line_item_params)
        if @line_item.update(line_item_params)
          # format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
          format.html { redirect_to @cart, notice: 'Item successfully updated.' }
          format.json { render :show, status: :ok, location: @line_item }
        else
          format.html { render :edit }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @cart = Cart.find(session[:cart_id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: "Item successfully removed from cart." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:item_id, :cart_id, :size, :flavor, :addins, :espresso_shots)
    end
end
