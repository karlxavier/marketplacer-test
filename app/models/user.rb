class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable

  extend Devise::Models
  include DeviseTokenAuth::Concerns::User

  has_many :carts

  def open_cart
    self.carts.open.first
  end
end
