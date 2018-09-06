class ProductsController < Admin::BaseController
<<<<<<< HEAD
  
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
=======
  def index
    @products = Product.all
  end

  def show; end
>>>>>>> 5b35f5a81aef367a1d2fd4caad0e3ec600b1c368

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
<<<<<<< HEAD
      redirect_to products_path(@product)
=======
      redirect_to products_path(@user)
>>>>>>> 5b35f5a81aef367a1d2fd4caad0e3ec600b1c368
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

<<<<<<< HEAD

=======
>>>>>>> 5b35f5a81aef367a1d2fd4caad0e3ec600b1c368
  def product_params
    params.require(:product).permit(
      :name, :description, :price, :in_stock, :available
    )
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> 5b35f5a81aef367a1d2fd4caad0e3ec600b1c368
