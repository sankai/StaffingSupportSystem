class Anken < ActiveRecord::Base
  attr_accessible :customer, :estimatePrice, :memo, :name, :ankenstatus_id, :dept_id

  has_many :assignments
  belongs_to :ankenstatus
  belongs_to :dept

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["dept", "name", "customer", "estimatePrice", "ankenstatus", "memo"]
      all.each do | anken |
        row = Array.new
        row.push(anken.dept_id)
        row.push(anken.dept.name.encode("Shift_JIS"))
        row.push(anken.name.encode("Shift_JIS"))
        row.push(anken.customer.encode("Shift_JIS"))
        row.push(anken.estimatePrice)
        row.push(anken.ankenstatus.name.encode("Shift_JIS"))
        row.push(anken.memo.encode("Shift_JIS"))
        csv << row
      end
    end
  end
  
  def self.from_csv(anArray)
    newAnken = new
    newAnken.dept_id         = anArray[0].to_i
    newAnken.name            = anArray[2].to_s.encode('utf-8', 'sjis')
    newAnken.customer        = anArray[3].to_s.encode('utf-8', 'sjis')
    newAnken.estimatePrice   = anArray[4].to_i
    newAnken.ankanstatus_id  = 1
    newAnken.nemo            = anArray[6].to_s.encode('utf-8', 'sjis')
    return newAnken    
  end
  
end
