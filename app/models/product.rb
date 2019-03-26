class Product < ActiveRecord::Base

  has_many :reviews
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def self.update_product_quantity(product, quantity)
    bought_product = Product.find_by(id: product.id)
    bought_product.update_attribute(:quantity, -quantity)
    return product
  end
end
