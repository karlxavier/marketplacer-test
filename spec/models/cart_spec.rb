require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe '#calculate_discounts' do
    let(:cart) { build(:cart) }
    let(:product_uuids) { [] }

    before do
      product_uuids.each do |uuid|
        cart.cart_items.build(product_uuid: uuid)
      end

      cart.save
    end

    context 'when subtotal is less than the promotional rates' do
      let(:product_uuids) { %w[1411] }

      it 'calculates without discount price' do
        expect(cart.subtotal.to_f).to eq(15.39)
        expect(cart.discount_amount.to_f).to eq(0.0)
        expect(cart.total_price.to_f).to eq(15.39)
        expect(cart.discount_messages).to eq([])
      end
    end

    context 'when subtotal is greater than $20 but less than $50' do
      let(:product_uuids) { %w[1411 9101] }

      it 'calculates with 10% discount' do
        expect(cart.subtotal.to_f).to eq(46.61)
        expect(cart.discount_amount.to_f).to eq(4.66)
        expect(cart.total_price.to_f).to eq(41.95)
        expect(cart.discount_messages).to eq([ 'Discount applied: 10% off on total greater than $20' ])
      end
    end

    context 'when subtotal is greater than $50 but less than $100' do
      let(:product_uuids) { %w[23881 1411] }

      it 'calculates with 15% discount' do
        expect(cart.subtotal.to_f).to eq(81.34)
        expect(cart.discount_amount.to_f).to eq(12.2)
        expect(cart.total_price.to_f).to eq(69.14)
        expect(cart.discount_messages).to eq([ 'Discount applied: 15% off on total greater than $50' ])
      end
    end

    context 'when subtotal is greater than $100' do
      let(:product_uuids) { %w[13008 23881] }

      it 'calculates with 15% discount' do
        expect(cart.subtotal.to_f).to eq(157.95)
        expect(cart.discount_amount.to_f).to eq(31.59)
        expect(cart.total_price.to_f).to eq(126.36)
        expect(cart.discount_messages).to eq([ 'Discount applied: 20% off on total greater than $100' ])
      end
    end
  end
end
