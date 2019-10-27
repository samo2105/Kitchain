class Table < ApplicationRecord
  has_many :sales, dependent: :nullify
  belongs_to :office
end
