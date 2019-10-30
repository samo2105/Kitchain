class Product < ApplicationRecord
  belongs_to :office
  has_many :orders, dependent: :destroy
  has_many :sales, through: :orders
  has_one_attached :image, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
end
