class Product < ActiveRecord::Base

  has_many :reviews
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def self.update_product_quantity(product, quantity = 0)
    return product unless quantity
    # bought_product = Product.find_by(id: product.id)
    product.update_attribute(:quantity, product.quantity - quantity)
    # product.quantity -= quantity
    # product.save
    product
  end
end
