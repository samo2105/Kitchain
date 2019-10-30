class Commerce < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offices, dependent: :destroy
  has_many :workers, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :rol, presence: true, uniqueness: true
  validates :name, presence: true

  def self.find_orders_ids(commerce)
    orders = []
    commerce.offices.each do |office|
      office.sales.each do |sale |
        sale.orders.each do |order|
          orders << order.id
        end
      end
    end
    orders
  end
end
