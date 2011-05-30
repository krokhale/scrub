class Poll < ActiveRecord::Base
  belongs_to :scrible
  has_many :poll_options
end
