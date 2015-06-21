class Customer < ActiveRecord::Base
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  has_many :orders
  has_many :ratings

  def create_order order_params
    self.orders.create(order_params)
  end

  def current_order
    self.orders.find_by(aasm_state: 'in_progress')
  end
end
