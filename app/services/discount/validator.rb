module Discount
  class Validator
    attr_accessor :calculations, :transaction, :rules

    def initialize(transaction:, discount_rule:)
      @transaction = transaction
      @calculations = discount_rule.calculations
      @rules = discount_rule.rules
    end

    def applicable?
      success = false

      rules.each do |rule|
        actual_value = transaction.send(rule["field"]).to_f
        value = rule["value"].to_f

        case rule["operator"]
        when ">"
          success = actual_value > value
        when ">="
          success = actual_value >= value
        else
          raise ArgumentError, "Unsupported operator: #{rule["operator"]}"
        end
      end

      success
    end

    def calculated_discount
      result = 0

      calculations.each do |calculation|
        actual_value = transaction.send(calculation["field"])
        value = calculation["value"]

        case calculation["operator"]
        when "%"
          result = (actual_value * value) / 100
        else
          raise ArgumentError, "Unsupported operator: #{operator}"
        end
      end

      result.round(2)
    end
  end
end
