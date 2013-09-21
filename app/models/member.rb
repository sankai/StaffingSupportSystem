class Member < ActiveRecord::Base

  attr_accessible :code, :email, :name

  validates :code, :presence => true, :uniqueness => true
  
  has_and_belongs_to_many :assignments

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
  
  def self.from_csv(anArray)
    m = new
    m.code  = anArray[0]
    m.name  = anArray[1].to_s.encode('utf-8', 'sjis')
    m.email = anArray[2]
    return m    
  end
  
end
