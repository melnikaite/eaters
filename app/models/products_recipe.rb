class ProductsRecipe < ActiveRecord::Base
  belongs_to :product
  belongs_to :recipe
  belongs_to :unit

  validates_presence_of :product, :recipe, :user
end
