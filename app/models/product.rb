class Product < ApplicationRecord
  belongs_to :office
  has_many :orders, dependent: :destroy
  has_many :sales, through: :orders

  validates :name, presence: true
  validates :price, presence: true
end
