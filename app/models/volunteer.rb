class Volunteer < ApplicationRecord
  
  belongs_to :organisation
  
  validates :name,
          presence: true
          
  validates :time,
          presence: true
  
  validates :date,
          presence: true
  
   
  def oid
  end
  
    
 
end