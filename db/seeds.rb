user = User.create!(name: 'Test User 1', email: 'user1@test.com', password: 'password')
cart = Cart.build(user:)
cart.cart_items.build(product_uuid: '1411')
cart.cart_items.build(product_uuid: '23881')
cart.save
