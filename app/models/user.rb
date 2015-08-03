class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  has_many :orders
  has_many :ratings

  def create_order order_params
    self.orders.create(order_params)
  end

  def current_order
    self.orders.find_by(aasm_state: 'in_progress')
  end

  def full_name
    first_name + ' ' + last_name
  end
end
