class Sale < ApplicationRecord
  belongs_to :worker
  belongs_to :table
  has_many :orders, dependent: :destroy
  has_many :products, through: :orders
end
