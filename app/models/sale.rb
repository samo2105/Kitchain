class Sale < ApplicationRecord
  belongs_to :worker, optional: true
  belongs_to :table, optional: true
  belongs_to :office
  has_many :orders
  has_many :products, through: :orders
end
