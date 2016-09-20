class Matches < ApplicationRecord

  validates :location,
            presence: true
  validates :impactfocus,
            presence: true
            
  validates :projecttype, 
            presence: true
  validates :projectname, 
            presence: true  
  validates :milestones, 
            presence: true
end 