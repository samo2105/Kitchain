class Office < ApplicationRecord
  belongs_to :commerce
  has_many :workers, dependent: :nullify
  has_many :sales, dependent: :nullify
  has_many :products, dependent: :destroy
end
