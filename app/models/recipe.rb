class Recipe < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :products
  validates_presence_of :title, :user
end
