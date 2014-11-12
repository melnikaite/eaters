class Integration < ActiveRecord::Base
  serialize :details
  belongs_to :user

  validates_presence_of :provider, :user
end
