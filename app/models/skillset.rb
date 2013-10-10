class Skillset < ActiveRecord::Base
  attr_accessible :field, :memo, :name
  has_many :members, through: :skill_evaluations

end
