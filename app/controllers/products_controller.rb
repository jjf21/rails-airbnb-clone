class ProductsController < ApplicationController
  before_action :set_product, only:[:edit, :show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @booking = @product.bookings.new
    @marker_hash = Gmaps4rails.build_markers(@product) do |product, marker|
      marker.lat product.lat
      marker.lng product.lng
    end
  end

  def index

    lat = params[:lat]
    lng = params[:lng]

    if lat.blank? || lng.blank?
      @products = Product.where.not(latitude: nil, longitude: nil)
    else
      @products = Product.near([lat, lng], 20)
    end

    @markers_hash = Gmaps4rails.build_markers(@products) do |product, marker|
      marker.lat product.latitude
      marker.lng product.longitude
    end

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
                                    :photo_cache,
                                    :latitude,
                                    :longitude
                                    )
  end

end
