class Worker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :office, optional: true
  belongs_to :commerce
  has_many :sales, dependent: :nullify
  has_one_attached :image, dependent: :destroy

  validates :rol, uniqueness: true, presence: true
  validates :name, presence: true
end
