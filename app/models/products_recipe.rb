class ProductsRecipe < ActiveRecord::Base
  belongs_to :product
  belongs_to :recipe
  belongs_to :unit
end
