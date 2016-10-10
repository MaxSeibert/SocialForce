class Program < ApplicationRecord
  
  validates :name,
          presence: true
          
  validates :heading,
          presence: true
  
  validates :description,
          presence: true
  
    
 
end