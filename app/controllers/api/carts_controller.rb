module Api
  class CartsController < ApplicationController
    before_action :authenticate_api_user!

    def add_product
      cart = current_api_user.open_cart || current_api_user.carts.new
      product = Product.find_by_uuid(params[:product_uuid])
      cart_item = cart.cart_items.find_or_initialize_by(product_uuid: product.uuid)
      cart_item.quantity = params[:quantity].to_i
      cart_item.save!

      render json: { message: "Product added to cart", cart: cart }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Product not found" }, status: :not_found
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
