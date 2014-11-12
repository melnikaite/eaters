class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :unit
  has_and_belongs_to_many :recipes

  validates_presence_of :title, :user
end
