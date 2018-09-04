class ProductsController < Admin::BaseController
  def index
    @products = Product.all
  end

  def show; end

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
      redirect_to products_path(@user)
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
