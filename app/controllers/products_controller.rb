class ProductsController < Admin::BaseController
  
  before_action :find_product, only: %i[change edit update destroy]

  def index
    @products = Product.order(name: :asc)
  end

  def change
    if @product.available == true
      Product.update(@product.id,:available => false)
    else
      Product.update(@product.id,:available => true)
   end
   redirect_to products_path(@product)
  end

  def show;
  end

  def new
    @product = Product.new
    @title = :new
  end

  def create
    @title = :new
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
    @title = :edit
  end

  def update
    @title = :edit
    if @product.update(product_params)
      redirect_to products_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end


  def product_params
    params.require(:product).permit(
      :name, :description, :price, :in_stock, :available
    )
  end
end