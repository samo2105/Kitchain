class Office < ApplicationRecord
  belongs_to :commerce
  has_many :workers
  has_many :products, dependent: :destroy
end
