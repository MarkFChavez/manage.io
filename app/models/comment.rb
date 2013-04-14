class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :comment, :lock_version
  validates :comment, presence: true
end
