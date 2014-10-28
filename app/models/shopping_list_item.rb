class ShoppingListItem < ActiveRecord::Base
  belongs_to :shopping_list
  belongs_to :product
  belongs_to :unit

  def title
    "#{product.title} #{required} #{unit}"
  end
end
