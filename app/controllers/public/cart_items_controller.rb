class Public::CartItemsController < Public::ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item
      @cart_item.update(amount: @cart_item.amount + params[:cart_item][:amount].to_i)
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item = current_customer.cart_items.find(params[:id]).destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
