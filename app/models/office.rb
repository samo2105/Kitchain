class Office < ApplicationRecord
  belongs_to :commerce
  has_many :workers
  has_many :sales
  has_many :products, dependent: :destroy
end
