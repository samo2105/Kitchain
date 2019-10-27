class Office < ApplicationRecord
  belongs_to :commerce
  has_many :workers, dependent: :nullify
  has_many :sales, dependent: :nullify
  has_many :products, dependent: :destroy
  has_many :tables, dependent: :destroy

  def self.find_month_sales(office)
    date = Date.today
    office.sales.where(:created_at => date.at_beginning_of_month..date.at_end_of_month)
  end

  def self.find_year_sales(office)
    date = Date.today
    office.sales.where(:created_at => date.at_beginning_of_year..date.at_end_of_year)
  end

  def self.find_today_sales(office)
    date = Date.today
    office.sales.where(:created_at => date.at_beginning_of_day..date.at_end_of_day)
  end


end
