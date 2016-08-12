class CartsController < ApplicationController
  def show
    @carts = current_cart
  end

  def add_to_cart
    current_cart.add_item(params[:catalog_item])
    redirect_to carts_path(current_cart.id)
  end
end
