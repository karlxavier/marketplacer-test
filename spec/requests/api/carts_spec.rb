require "rails_helper"

RSpec.describe "API::Carts", type: :request do
  let(:user) { create(:user) }
  let(:product) { Product.find_by_uuid('23881') }
  let(:auth_headers) { user.create_new_auth_token }

  describe "POST /api/carts/add_product" do
    subject(:add_product) do
      post(
        api_carts_add_product_path,
        params: {
          product_uuid: product.uuid,
          quantity: 2
        },
        headers: auth_headers
      )
    end

    context 'when user have existing pending cart' do
      let(:cart) { create(:cart, user: user) }

      it "adds a product to the cart" do
        add_product

        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json_response["message"]).to eq("Product added to cart")
      end

      it 'calculates total price with discounts' do
        expect {
          add_product
          cart.reload
        }.to change { cart.subtotal }.from(0.0).to(131.9)
        .and change { cart.discount_amount }.from(0).to(26.38)
        .and change { cart.total_price }.from(0.0).to(105.52)
      end
    end

    context 'when user have no pending cart' do
      let(:cart) { build(:cart, user: user) }

      it "creates a new cart and add the product" do
        add_product

        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json_response["message"]).to eq("Product added to cart")
      end

      it 'calculates total price with discounts' do
        add_product

        open_cart = user.open_cart
        expect(open_cart.subtotal).to eq(131.9)
        expect(open_cart.discount_amount).to eq(26.38)
        expect(open_cart.total_price).to eq(105.52)
      end
    end
  end
end
