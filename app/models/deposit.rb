class Deposit < ActiveRecord::Base
 attr_accessible :amount, :n, :periods, :roi, :total, :dob, :name, :age

 before_save :calculate_age
   def calculate_age
     self.age = ((DateTime.now - dob) / 365.25).to_i
   end


before_save :calculate_interest
  def calculate_interest
    if self.age >= 75 && self.periods == 5
      self.roi += 0.0025 
    elsif self.age >= 58 && self.age <= 75 && self.periods == 5 
      self.roi += 0.0025   
     elsif self.age >= 58 && self.age <= 75 && self.periods == 4
      self.roi += 0.005 
    elsif self.age >= 75 && self.periods == 4
      self.roi += 0.0075
    elsif self.age >= 75 && self.periods == 3
      self.roi += 0.01 
    elsif self.age >= 58 && self.age <= 75 && self.periods == 3
      self.roi += 0.005
    elsif self.age >= 75 && self.periods == 2
      self.roi += 0.01 
    elsif self.age >= 58 && self.age <= 75 && self.periods == 2
      self.roi += 0.005
    elsif self.age >= 75 && self.periods == 1
      self.roi += 0.01 
    elsif self.age >= 58 && self.age <= 75 && self.periods == 1
      self.roi += 0.005
    elsif self.age >= 75 && self.periods == 0.5
      self.roi += 0.005
    else
      self.roi
    end
  end


before_save :calculate_value
#Calculate the Savings Deposit
#attr_accessor :amount

  def calculate_value
    self.total = amount * (1 + (roi / 12)) ** (12 * periods)
  end	
end