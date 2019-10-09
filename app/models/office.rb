class Office < ApplicationRecord
  belongs_to :commerce
  has_many :workers, dependent: :destroy
  has_many :products, dependent: :destroy
end
