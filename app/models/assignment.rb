class Assignment < ActiveRecord::Base
  attr_accessible :from, :roleComment, :status, :to, :num_engineer
  
  belongs_to :anken
  has_and_belongs_to_many :members
  
  def from_ymd
    self.from.strftime("%Y/%m/%d")
  end

  def to_ymd
    self.to.strftime("%Y/%m/%d")
  end
  
  def asTimelineRow
    # ‚È‚º‚©Google chart timeline‚Í1‚©ŒŽ‚¸‚ê‚Ä•\Ž¦‚³‚ê‚é‚Ì‚ÅA•â³‚µ‚Ä‚¢‚Ü‚·B
    newFrom = self.from.clone << 1
    newTo   = self.to.clone << 1
    
    anArray = Array.new()
    anArray.push(self.anken.customer)
    anArray.push(self.anken.name + ' : ' + self.roleComment)
    anArray.push(newFrom.year)
    anArray.push(newFrom.month)
    anArray.push(newFrom.day)
    anArray.push(newTo.year)
    anArray.push(newTo.month)
    anArray.push(newTo.day)
    return anArray
  end
end
