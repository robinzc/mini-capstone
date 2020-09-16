class Product < ApplicationRecord

  validates :name, presence: true, presence: true
  validates :image_path, presence: true
  validates :description, length: { in: 10..500 }
  validates :image_path, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :inventory, numericality: { greater_than: 0 }


  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end
