class BookingsController < ApplicationController
  before_action :set_booking, only:[:edit, :show, :update, :destroy]


  def show
  end

  def index
    user = current_user
    @bookings_done = current_user.bookings
    @bookings_receive = current_user.products_bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    user = current_user
    user.bookings.create(booking_params)
    product = Product.find(params[:product_id])
    flash[:notice] = "Booking made with sucess"
    redirect_to product_path(product)
  end

  def edit
    @product = Product.find(@booking.product_id)
  end

  def update
    @booking.update(booking_params)
    flash[:notice] = "Booking edited"
    redirect_to bookings_path
  end

  def destroy
    @booking.destroy
    flash[:notice] = "Booking deleted"
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(
                                    :start_date,
                                    :end_date,
                                    :product_id,
                                    :user_id,
                                    :status,
                                    :description
                                    )
  end

end
