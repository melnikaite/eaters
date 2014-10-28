class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :providers, dependent: :destroy
  has_many :integrations, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :products_recipes, dependent: :destroy
end
