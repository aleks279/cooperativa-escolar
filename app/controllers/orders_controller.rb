class OrdersController < ApplicationController
  before_action :find_order, except: %i[index new create]
  before_action :set_products, only: %i[new create edit update]

  def index
    @orders = Order.all
  end

  def show; end

  def new
    @order = Order.new
    @title = :new
  end

  def create
    @title = :new
    @order = Order.new(order_params)

    @order.seller = current_user

    if @order.save
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
      @order.calculate_total
      redirect_to order_path(@order)
    else
      render 'edit'
    end
  end

  def destroy
    @order.destroy if @order.present?
    redirect_to orders_path
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def set_products
    @products = Product.where(available: true)
  end

  def order_params
    params.require(:order).permit(
      :number, :date, :notes, :seller, :customer,
      order_items_attributes: %i[
        id amount order product_id _destroy
      ],
      customer_attributes: %i[
        first_name last_name email
      ]
    )
  end
end
