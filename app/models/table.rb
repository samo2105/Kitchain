class Table < ApplicationRecord
  has_many :sales, dependent: :destroy
end
