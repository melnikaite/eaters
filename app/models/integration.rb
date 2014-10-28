class Integration < ActiveRecord::Base
  serialize :details
  belongs_to :user
end
