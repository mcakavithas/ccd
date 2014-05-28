class Deposit < ActiveRecord::Base
 attr_accessible :amount, :n, :periods, :roi, :total, :dob, :name, :age

before_save :calculate_value
#Calculate the Savings Deposit
def calculate_value
self.total = amount * (1 + (roi / 12)) ** (12 * periods)
end

 before_save :calculate_age

 def calculate_age
 	self.age = ((DateTime.now - dob) / 365.25).to_i
 end

before_save :calculate_interest

def calculate_interest
if age >= 1 && age <=57
self.roi
end
if age >= 58 && age < 75
self.roi += 0.005
end
if age >= 75
self.roi += 0.01
end

end


end