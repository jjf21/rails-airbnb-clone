class BookingsController < ApplicationController
  before_action :set_booking, only:[:edit, :show, :update, :destroy, :accept, :cancelled]


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
    
    if booking_params['start_date'] > booking_params['end_date'] || booking_params['end_date'].blank? ||booking_params['end_date'] < Time.now
      flash[:alert] = "Dates invalides"
      return redirect_to product_path(Product.find(booking_params[:product_id]))
    end 

    user = current_user
    @booking = user.bookings.new(booking_params)
      if @booking.save
        flash[:notice] = "La reservation s'est bien passé"
        redirect_to bookings_path
      else
        flash[:alert] = "Erreur lors de la reservation "
        return redirect_to product_path(Product.find(booking_params[:product_id]))
      end
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
    flash[:notice] = "Reservation supprimer"
    redirect_to bookings_path
  end

  def accept
    @booking.status = 'accepté'
    @booking.save
    redirect_to bookings_path
  end

  def cancelled
    @booking.status = 'refusé'
    @booking.save
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
