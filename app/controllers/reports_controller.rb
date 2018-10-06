class ReportsController < ApplicationController

  def index
    @orders = search_params

    # @products = Product.select("products.*, SUM(order_items.amount) as total_qty, order_items.product_id")
    #                    .joins(:order_items).joins("INNER JOIN orders ON orders.id = order_items.order_id")
    #                    .where("EXTRACT( month from orders.created_at::date )::integer = '?' and EXTRACT( month from orders.created_at::date )::integer = '?'", @month, @year)
    #                    .group("order_items.product_id, product_id").order("total_qty DESC")

    @ganancia_total = @orders.sum(:total) if @orders

    respond_to do |format|
      format.html
      format.pdf do
        render template: 'reports/_pdf.html',
               pdf: "Reportes", # pdf will download as Reportes.pdf
               show_as_html: params[:debug].present? # renders html version if you set debug=true in URL
      end
    end
  end

  private

  def search_params
    return unless params[:date]
    @month, @year = params[:date].split('/')
    Order.by_year(@year).by_month(@month)
  end
end
