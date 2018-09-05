class OrdersController < Admin::BaseController

  def index
    @orders = Order.all
    @order_items = OrderItem.all
  end

  def show;
    @order_items = OrderItem.all
  end

  def new
    @order = Order.new
    @products = Product.all
    @title = :new
  end

  def create
    @title = :new
    @order = Order.new(orders_params)
    @order_items = OrderItem.new(orders_params)

    if @order.save
      if @order_items.save
        redirect_to orders_path
      end
    else
      render 'new'
    end
  end

  def edit
    @title = :edit
  end

  def update
    @title = :edit
    if @order.update(order_params)
      redirect_to orders_path(@order)
    else
      render 'edit'
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
      :number, :date, :total, :notes, :seller, :customer
    )
  end

  def order_item_params
    params.require(:order_item).permit(
      :amount, :item_total, :order, :product
    )
  end
end
