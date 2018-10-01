class OrdersController < ApplicationController
  before_action :find_order, except: %i[index new create]
  before_action :set_products, only: %i[new create edit update]

  def index
    @orders = Order.all

    respond_to do |format|
      format.html
      format.pdf do
        render template: 'orders/reports/pdf',
        :pdf => "Reportes", # pdf will download as my_pdf.pdf
        #:layout => 'pdf', # uses views/layouts/pdf.haml
        :show_as_html => params[:debug].present? # renders html version if you set debug=true in URL
      end
    end
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
    if @order.present?
      @order.destroy
    end
    redirect_to orders_path
  end

  def pdf
    respond_to do |format|
      format.html
      format.pdf do
        render template: 'orders/reports/pdf',
        :pdf => "Reportes", # pdf will download as my_pdf.pdf
        #:layout => 'pdf', # uses views/layouts/pdf.haml
        :show_as_html => params[:debug].present? # renders html version if you set debug=true in URL
      end
    end
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
      order_items_attributes: [
        :id, :amount, :order, :product_id, :_destroy
      ],
      customer_attributes: [
        :first_name, :last_name, :email,
      ]
    )
  end
end
