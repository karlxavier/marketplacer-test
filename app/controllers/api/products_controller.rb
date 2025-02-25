class Api::ProductsController < ApplicationController
  before_action :authenticate_api_user!

  def index
    products = Product.all
    render(json: { products:, status: :ok })
  end
end
