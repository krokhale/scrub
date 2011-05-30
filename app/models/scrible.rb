class Scrible < ActiveRecord::Base
  has_many :branches
  has_many :comments
  has_many :polls
  
  acts_as_taggable
end
