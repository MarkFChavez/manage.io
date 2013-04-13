class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
