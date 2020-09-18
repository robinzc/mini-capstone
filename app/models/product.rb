class Product < ApplicationRecord

  # validates :name, presence: true, presence: true
  # validates :image_path, presence: true
  # validates :description, length: { in: 10..500 }
  # validates :image_path, presence: true
  # validates :price, numericality: { greater_than: 0 }
  # validates :inventory, numericality: { greater_than: 0 }

#Class method
  # scope :name_search, -> (search_term) { where ("name iLIKE ?", "%#{search_term}%") }

# Associations method (instance method)... long-hand
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  belongs_to :supplier

#Instance method/model method
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
