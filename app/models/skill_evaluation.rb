class SkillEvaluation < ActiveRecord::Base
  attr_accessible :evaluation, :member_id, :skillset_id
  belongs_to :member
  belongs_to :skillset
end
