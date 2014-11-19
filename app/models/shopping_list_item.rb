class ShoppingListItem < ActiveRecord::Base
  belongs_to :shopping_list
  belongs_to :product
  belongs_to :unit
  before_create :update_existing
  before_save :recalculate_prices
  validates_presence_of :product, :shopping_list

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

  def recalculate_prices
    if required_changed? || unit_price_changed?
      self.total_price = required.to_f * unit_price.to_f
      return true
    end

    if total_price_changed? && required.to_f > 0
      self.unit_price = (total_price.to_f / required.to_f).round(2)
      return true
    end
  end
end
