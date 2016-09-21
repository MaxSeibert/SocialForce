class Organisation < ApplicationRecord
  
  belongs_to :user
  has_many :matches
  
   validates :oname,
            presence: true

  validates :olocation,
            presence: true
            
  validates :oimpactfocus,
            presence: true
            
  validates :oprojecttype, 
            presence: true
  validates :omilestones, 
            presence: true 
             
  validates :otfrom, 
            date: true,
            allow_blank: true
  validates :otto, 
            date: true,
            allow_blank: true          

  validates :oamount,
            presence: true,
            allow_blank: true
       
  validates :oequipment, 
            presence: true,
            allow_blank: true
             
  validates :ostaff,
            presence: true,
            allow_blank: true
            
  
  
  
end