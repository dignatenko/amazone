class Order < ActiveRecord::Base
  include AASM
  validates :total_price, :completed_date, :aasm_state, presence: true

  belongs_to :user
  belongs_to :credit_card
  has_many :order_items
  has_one :billing_address, :class_name => "BillingAddress"
  has_one :shipping_address, :class_name => "ShippingAddress"

  aasm do
    state :in_progress, :initial => true
    state :shipped
    state :completed

    event :deliver do
      transitions :from => :in_progress, :to => :shipped
    end

    event :complete do
      transitions :from => :shipped, :to => :completed
    end
  end

  def add_order_item book, quantity = 1
    order_item = self.order_items.create(book_id: book.id, price: book.price * quantity, quantity: quantity)
    count_total_price
    order_item
  end

  def count_total_price
    self.total_price = self.order_items.sum(:price)
    self.save
  end

end
