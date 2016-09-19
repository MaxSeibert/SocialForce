class Profile < ApplicationRecord
  
 belongs_to :user

  validates :name,
            presence: true
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
  
  validates :tfrom, 
            presence: true 
  validates :tto, 
            presence: true 
  
  validates :resources, 
            presence: true         

end