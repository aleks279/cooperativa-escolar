class ReportsController < ApplicationController
  before_action :find_order, except: %i[index new create report]
  before_action :set_products, only: %i[new create edit update]

  def index
    #@orders_per_month = OrderItem.where("EXTRACT( month from created_at::date)::integer = '?' and EXTRACT( year from created_at::date)::integer = '?'", DateTime.now.month,DateTime.now.year)

    @cantidad_productos = OrderItem.where("EXTRACT( month from created_at::date)::integer = '?' and EXTRACT( year from created_at::date)::integer = '?'", DateTime.now.month,DateTime.now.year).group(:product_id).count
    @cantidad_productos_aux = @cantidad_productos.sort_by{|k,v| v}.reverse

    @masvendidos = Hash.new

    @cantidad_productos_aux.each do |k,v|
      @masvendidos[Product.find(k).name] = v
    end  

    @ordenes_por_mes = Order.where("EXTRACT( month from created_at::date)::integer = '?' and EXTRACT( year from created_at::date)::integer = '?'", DateTime.now.month,DateTime.now.year).count

    @ganancia_total = Order.where("EXTRACT( month from created_at::date)::integer = '?' and EXTRACT( year from created_at::date)::integer = '?'", DateTime.now.month,DateTime.now.year).sum(:total)

    respond_to do |format|
      format.html
      format.pdf do
        render template: 'reports/_pdf.html',
        :pdf => "Reportes", # pdf will download as Reportes.pdf
        :show_as_html => params[:debug].present? # renders html version if you set debug=true in URL
      end
    end
  end

  def show; end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def report
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


#Order.where("MONTH(date_column) = ? and DAY(date_column) = ?", DateTime.now.month, DateTime.now.day)
#Order.select("EXTRACT( month from created_at::date) as date")  
#Consulta por mes
#Order.where("EXTRACT( month from created_at::date)::integer = '?' ",DateTime.now.month)

#Order.where("EXTRACT( month from created_at::date)::integer = '?' and EXTRACT( year from created_at::date)::integer = '?'", DateTime.now.month,DateTime.now.year)




#Best Sellers

#OrderItem.where("EXTRACT( month from created_at::date)::integer = '?' and EXTRACT( year from created_at::date)::integer = '?'", DateTime.now.month,DateTime.now.year).group(:product_id).count
#a.sort_by{|k,v| v}.reverse