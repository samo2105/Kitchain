class Order < ApplicationRecord
  belongs_to :product
  belongs_to :sale

  validates :quantity, presence: true
  validates :amount, presence: true
end
