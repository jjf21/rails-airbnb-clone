class ReviewsController < ApplicationController

  def new
  end

  def create
    product = Product.find(params[:product_id])
    review = Review.new(product_params)
    if current_user == product.user
      flash[:alert] = "Vous ne pouvez pas noter votre produit, Flix fais pas le con !"
      return redirect_to product_path(product)
    end

    booked = false
    current_user.bookings.each do |booking|
      booked = true if booking.product == product && booking.status == 'accepté'
    end


    if review.save && booked
      flash[:notice] = "Ajout de l'avis"
      redirect_to product_path(product)
    else
      flash[:alert] = "Vous ne pouvez pas ajouter d'avis"
      redirect_to product_path(product)
    end

  end
  
  private

  def product_params
    params.require(:review).permit(
                                    :content,
                                    :rating,
                                    :user_id,
                                    :product_id
                                    )
  end
end
