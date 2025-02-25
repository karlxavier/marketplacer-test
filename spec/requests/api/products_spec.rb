require 'rails_helper'

RSpec.describe "API::Products", type: :request do
  let(:user) { create(:user) }
  let(:auth_headers) { user.create_new_auth_token }

  describe "GET /api/products" do
    subject(:fetch_products) do
      get(
        api_products_path,
        headers: auth_headers
      )
    end

    it "returns a list of products" do
      fetch_products

      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json_response['products'].size).to eq(4)
    end
  end
end
