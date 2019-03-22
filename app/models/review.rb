class Review < ActiveRecord::Base
  belongs_to :products
  belongs_to :users

  # validates :product_id
  # validates :user_id
  validates :description, presence: true
  validates :rating, presence: true

  def product_id_exists
    return false if Product.find_by_id(self.product_id).nil?
  end

  def user_id_exists
    return false if User.find_by_id(self.user_id).nil?
  end
end
