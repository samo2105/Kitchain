class Commerce < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offices, dependent: :destroy
  has_many :workers, dependent: :destroy
  has_many :sales, dependent: :destroy
end
