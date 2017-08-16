class ProductsController < ApplicationController
  before_action :set_product, only:[:edit, :show, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index
  
  def show
    @booking = @product.bookings.new
  end

  def index
    @products = Product.all
    speciality = params[:speciality]
    address = params[:address]
    price = params[:price]
  end

  def new
    @product = Product.new
  end

  def create
    user = current_user
    user.products.create(product_params)
    redirect_to products_path
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
                                    :description,
                                    :first_name,
                                    :last_name,
                                    :user, 
                                    :date_of_birth, 
                                    :price, 
                                    :phone_number,
                                    :address,
                                    :city,
                                    :postal_code,
                                    :lat,
                                    :lng,
                                    :height,
                                    :weight,
                                    :shoes,
                                    :eyes,
                                    :hair,
                                    :photo,
                                    :photo_cache
                                    )
  end

end
