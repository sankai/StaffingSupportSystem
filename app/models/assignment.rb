class Assignment < ActiveRecord::Base
  attr_accessible :from, :roleComment, :status, :to, :num_engineer
  
  belongs_to :anken
  has_and_belongs_to_many :members

end
