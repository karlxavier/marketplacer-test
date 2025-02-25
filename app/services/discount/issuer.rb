module Discount
  class Issuer
    class DiscountsIssuanceError < StandardError; end

    attr_accessor :transaction

    def initialize(transaction:)
      @transaction = transaction
    end

    def calculate!
      transaction.subtotal = transaction.cart_items.sum { |item| item.quantity * item.product_price }

      [].tap do |discountable_amount|
        discount_groups.each do |discount_rules|
          discount_rules.last.each do |discount_rule|
            validator = Validator.new(transaction:, discount_rule:)
            next unless validator.applicable?

            transaction.discount_transactions.find_or_initialize_by(discount_rule:)
            discountable_amount << validator.calculated_discount
            break
          end
        end

        transaction.discount_amount = discountable_amount.sum.round(2)
        transaction.total_price = transaction.subtotal - transaction.discount_amount
      end
    end

    private

    def discount_groups
      @discount_groups ||= DiscountRule.active_rules.order(priority: :asc).group_by(&:group_name)
    end
  end
end
