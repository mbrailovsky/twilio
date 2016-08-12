class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      'registrations'
    else
      'application'
    end
  end

  def current_cart
    if session[:cart_id]
      @current_cart ||= Carts.find(session[:cart_id])
    end
    if session[:cart_id].nil?
      @current_cart = Carts.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end
end
