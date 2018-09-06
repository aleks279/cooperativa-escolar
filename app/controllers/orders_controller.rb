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
    @products = Product.where(available: true)
    @title = :new
  end

  def create
    @title = :new
    @order = Order.new(order_params)
    @products = Product.where(available: true)

    @order.seller = current_user

    if @order.save
        redirect_to orders_path
      redirect_to orders_path
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
      :number, :date, :notes, :seller, :customer,
      order_items_attributes: [
        :amount, :order, :product_id,
      ],
      customer_attributes: [
        :first_name, :last_name, :email,
      ]
    )
  end
end
