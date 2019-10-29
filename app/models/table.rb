class Table < ApplicationRecord
  has_many :sales, dependent: :nullify
  belongs_to :office

  validates :description, presence: true
end
