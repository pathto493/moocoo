class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :purchase, optional: true

  validates :quantity, presence: true, numericality: { only_integer: true }

  validate :user_and_product_cannot_be_the_same

  def user_and_product_cannot_be_the_same
    other_orders = self.user.orders
    bad_cart = other_orders.any? { |order| order.user_id == self.user_id && order.product_id == self.product_id }
    if self.confirmed == false && bad_cart
      errors.add(:bad_cart, 'you cannot have repeated instances of the same product in your cart, please modify the amount instead')
    end
  end
end
