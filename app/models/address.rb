class Address < ActiveRecord::Base
  validates :street, :zipcode, :city, :phone, :country_id, presence: true
  
  belongs_to :order
  belongs_to :country
end
