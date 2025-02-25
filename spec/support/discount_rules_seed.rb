class DiscountRulesSeed
  DISCOUNT_RULES = [
    {
      group_name: 'DEFAULT_PROMO',
      priority: 3,
      message: 'Discount applied: 10% off on total greater than $20',
      rules: [
        {
          field: 'subtotal',
          operator: '>',
          value: '20'
        }
      ],
      calculations: [
        {
          field: 'subtotal',
          operator: '%',
          value: 10
        }
      ]
    },
    {
      group_name: 'DEFAULT_PROMO',
      priority: 2,
      message: 'Discount applied: 15% off on total greater than $50',
      rules: [
        {
          field: 'subtotal',
          operator: '>',
          value: '50'
        }
      ],
      calculations: [
        {
          field: 'subtotal',
          operator: '%',
          value: 15
        }
      ]
    },
    {
      group_name: 'DEFAULT_PROMO',
      priority: 1,
      message: 'Discount applied: 20% off on total greater than $100',
      rules: [
        {
          field: 'subtotal',
          operator: '>',
          value: '100'
        }
      ],
      calculations: [
        {
          field: 'subtotal',
          operator: '%',
          value: 20
        }
      ]
    },
    {
      group_name: 'SUMMER_PROMO',
      priority: 1,
      message: 'Discount applied: 50% off on total greater than $1000',
      rules: [
        {
          field: 'subtotal',
          operator: '>=',
          value: '1000'
        }
      ],
      calculations: [
        {
          field: 'subtotal',
          operator: '%',
          value: 80
        }
      ]
    }
  ]

  class << self
    def create_seeds
      DISCOUNT_RULES.each do |rules|
        DiscountRule.create!(rules)
      end
    end
  end
end
