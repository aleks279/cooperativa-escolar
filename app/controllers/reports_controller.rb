class ReportsController < ApplicationController
  before_action :find_order, except: %i[index new create report]
  before_action :set_products, only: %i[new create edit update]

  def index
    @orders = Order.all

    respond_to do |format|
      format.html
      format.pdf do
        render template: 'reports/index.html',
        :pdf => "Reportes", # pdf will download as my_pdf.pdf
        #:layout => 'index.html', # uses views/layouts/pdf.haml
        :show_as_html => params[:debug].present? # renders html version if you set debug=true in URL
      end
    end
    #respond_to do |format|
    #  format.html
    #  format.pdf do
    #    send_data ReportDrawer.draw(@orders), :filename => 'reporte.pdf', :type => 'application/pdf', :disposition => 'inline' 
    #  end
    #end

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
