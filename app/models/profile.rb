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
            date: true,         
            allow_blank: true
            
  validates :tto, 
            date: true,         
            allow_blank: true
            
  validates :resources, 
            presence: true         

  #validates :user_id,
  #         uniqueness: true
end