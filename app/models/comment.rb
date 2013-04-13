class Comment < ActiveRecord::Base
  belongs_to :project
  attr_accessible :comment, :lock_version
end
