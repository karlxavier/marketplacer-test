class DiscountRulesSeed
  DISCOUNT_RULES = [
    {
      group_name: 'DEFAULT_PROMO',
      priority: 3,
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
