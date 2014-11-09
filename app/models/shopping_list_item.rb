class ShoppingListItem < ActiveRecord::Base
  belongs_to :shopping_list
  belongs_to :product
  belongs_to :unit
  before_create :update_existing

  def title
    "#{product.title} #{required} #{unit.try(:title)}"
  end

  def find_existing
    ShoppingListItem.find_by(product_id: self.product_id, shopping_list_id: self.shopping_list_id)
  end

  def update_existing
    if existing = self.find_existing
      existing.update_attribute(:required, existing.required.to_i + self.required.to_i)
      false
    else
      true
    end
  end
end
