class SkillsetRole < ActiveRecord::Base
  attr_accessible :memo, :name
  has_many :members, through: :skill_evaluation, as: skillsets
end
