class Public::OrdersController < Public::ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer = current_customer
    @cart_items = current_customer.cart_items
    @order.shopping_cost = 800
    @order.total_payment = @cart_items.sum { |c| (c.item.price * 1.1).ceil * c.amount } + 800
    if @order.valid?
      render :confirm
    else
      @addresses = current_customer.addresses
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    if @order.save
      current_customer.cart_items.each do |cart_item|
      OrderDetail.create(
        order_id: @order.id,
        item_id: cart_item.item_id,
        price: (cart_item.item.price * 1.1).ceil,
        amount: cart_item.amount
      )
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_thanks_path
    else
      @addresses = current_customer.addresses  # 追加！
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  def thanks
  end

private

  def order_params
    params.require(:order).permit(
      :postal_code,
      :address,
      :name,
      :payment_method,
      :shopping_cost,
      :total_payment
    )
  end
end
