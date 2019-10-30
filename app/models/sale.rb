class Sale < ApplicationRecord
  belongs_to :worker, optional: true
  belongs_to :table, optional: true
  belongs_to :office, optional: true
  belongs_to :commerce
  has_many :orders, dependent: :destroy
  has_many :products, through: :orders

  validates :total, presence: true
end
