# encording: UTF-8
class Member < ActiveRecord::Base

  attr_accessible :code, :email, :name

  validates :code, :presence => true, :uniqueness => true
  
  has_and_belongs_to_many :assignments
  has_many :skill_evaluations
  has_many :skillsets, through: :skill_evaluations

  # CSVの1行に変換する
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["code", "name", "email"]
      all.each do | member |
        row = Array.new
        row.push(member.code.encode("Shift_JIS"))
        row.push(member.name.encode("Shift_JIS"))
        row.push(member.email.encode("Shift_JIS"))
        csv << row
      end
    end
  end
  
  # CSVの1行をもとにインスタンスを作って返す
  def self.from_csv(anArray)
    m = new
    m.code  = anArray[0]
    m.name  = anArray[1].to_s.encode('utf-8', 'sjis')
    m.email = anArray[2]
    return m    	
  end
  
  # 
  def all_skillEvaluations
    work_skillsets = Array.new()
    #self.skillsets.each do | s |
    #  puts s.name	
    #end
    self.skill_evaluations.each do | eval |
      work_skillsets.push(eval.skillset)
    end
    
    Skillset.all().each do | skillset |
      if work_skillsets.index(skillset).nil?
        new_eval = self.skill_evaluations.new()
        new_eval.skillset = skillset
        new_eval.evaluation = ''
        new_eval.save()
      end
    end
    return self.skill_evaluations.sort_by{ |model| model.skillset.id }   
  end
  
  def asTimelineRows
    anArray = Array.new()
    self.assignments.each do | anAssignment |
      anArray.push(anAssignment.asTimelineRow)
    end
    return anArray
  end
  
end
