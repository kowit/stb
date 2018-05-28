class EmployeeLineItemsController < ApplicationController
  include CurrentEmployeeCart
  # before_action :authenticate_user!
  before_action :set_employee_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_employee_cart, only: [:create]

  # GET /line_items
  # GET /line_items.json
  def index
    @employee_line_items = EmployeeLineItem.all
    @items = Item.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @employee_line_item = EmployeeLineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    # find the Item with the item_id as the params
    @item = Item.find(params[:item_id])
    @employee_line_item = @employee_cart.add_item_to_employee_cart(@item)

    respond_to do |format|
      if @employee_line_item.save
        # format.html { redirect_to items_path, notice: 'Item added to cart' }
        format.html { 
          redirect_to @employee_line_item.employee_cart, notice: 'Item added to cart.' 
        }
        format.json { 
          render :show, status: :created, location: @employee_line_item 
        }
      else
        format.html { 
          render :new 
        }
        format.json { 
          render json: @employee_line_item.errors, status: :unprocessable_entity 
        }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @employee_line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_line_item }
      else
        format.html { render :edit }
        format.json { render json: @employee_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @employee_cart = EmployeeCart.find(session[:employee_cart_id])
    @employee_line_item.destroy

    respond_to do |format|
      format.html { redirect_to employee_cart_path(@employee_cart), notice: "Item successfully removed from cart." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_line_item
      @employee_line_item = EmployeeLineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_line_item_params
      params.require(:employee_line_item).permit(:item_id, :employee_cart_id)
    end
end
