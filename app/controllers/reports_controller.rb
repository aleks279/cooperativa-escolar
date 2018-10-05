class ReportsController < ApplicationController

  def index
    # @orders_per_month = OrderItem.where("EXTRACT( month from created_at::date)::integer = '?' and EXTRACT( year from created_at::date)::integer = '?'", DateTime.now.month,DateTime.now.year)
    @day = DateTime.now.day
    @month = DateTime.now.month
    @year = DateTime.now.year

    @vendedor = current_user

    @monthText =  if @month == 1
                    @monthText ='enero'
                  elsif @month == 2
                    @monthText = 'febrero'
                  elsif @month == 3
                    @monthText = 'marzo'
                  elsif @month == 4
                    @monthText = 'abril'
                  elsif @month == 5
                    @monthText = 'mayo'
                  elsif @month == 6
                    @monthText = 'junio'
                  elsif @month == 7
                    @monthText = 'julio'
                  elsif @month == 8
                    @monthText = 'agosto'
                  elsif @month == 9
                    @monthText = 'septiembre'
                  elsif @month == 10
                    @monthText = 'octubre'
                  elsif @month == 11
                    @monthText = 'noviembre'
                  else
                    @monthText = 'diciembre'
                  end

    @cantidad_productos = OrderItem.where("EXTRACT( month from created_at::date)::integer = '?' and EXTRACT( year from created_at::date)::integer = '?'", @month, @year).group(:product_id).count
    @cantidad_productos_aux = @cantidad_productos.sort_by { |_k, v| v }.reverse

    @masvendidos = {}

    i = 0
    @cantidad_productos_aux.each do |k, v|
      @masvendidos[Product.find(k).name] = v
      i += 1
      if i == 10
        break
      end
    end

    @ordenes_por_mes = Order.where("EXTRACT( month from created_at::date)::integer = '?' and EXTRACT( year from created_at::date)::integer = '?'", @month, @year).count

    @ganancia_total = Order.where("EXTRACT( month from created_at::date)::integer = '?' and EXTRACT( year from created_at::date)::integer = '?'", @month, @year).sum(:total)

    @cantidad_vendedores = Order.select(:seller_id).where("EXTRACT( month from created_at::date)::integer = '?' and EXTRACT( year from created_at::date)::integer = '?'", @month, @year).distinct.count

    @cantidad_vendedores = 1 if @cantidad_vendedores == 0

    @date_inicio = 1
    @ganancia_por_miembro = @ganancia_total / @cantidad_vendedores

    respond_to do |format|
      format.html
      format.pdf do
        render template: 'reports/_pdf.html',
               pdf: "Reportes", # pdf will download as Reportes.pdf
               show_as_html: params[:debug].present? # renders html version if you set debug=true in URL
      end
    end
  end

  def show; end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end

  def report; end
end
