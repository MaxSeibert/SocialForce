class Matches < ApplicationRecord

  belongs_to :organisation

  validates :name,
            presence: true

  validates :location,
            presence: true
            
  validates :score,
            presence: true
            
  validates :projecttype, 
            presence: true
  validates :milestones, 
            presence: true 
             
  validates :tfrom, 
            date: true,
            allow_blank: true
  validates :tto, 
            date: true,
            allow_blank: true          

  validates :amount,
            presence: true,
            allow_blank: true
       
  validates :equipment, 
            presence:true,
            allow_blank: true
             
  validates :staff,
            presence: true,
            allow_blank: true

            
       
#  def get_score
#    if Profile.resource =="amount" 
#      if Organisation.amount => 10000
#        amount_score = 10
#      end
#      if Organisation.amount <= 9000 & Organisation.amount >= 8000
#        amount_score = 9
#      end
#      if Organisation.amount <= 8000 & Organisation.amount >= 7000
#        amount_score = 8
#      end
#      if Organisation.amount <= 7000 & Organisation.amount >= 6000
#        amount_score = 7
#      end
#      if Organisation.amount <= 6000 & Organisation.amount >= 5000
#        amount_score = 6
#      end
#      if Organisation.amount <= 5000 & Organisation.amount > 4000
#        amount_score = 5
#      end
#      if Organisation.amount < 4000 
#        amount_score = 4
#      end
#    end  
#    
#   if Profile.resource =="equipment" 
#    if Organisation.equipment => 50
#        equipment_score = 10
#    end  
#    if Organisation.equipment <= 50 & Organisation.equipment >= 40
#        equipment_score = 8
#    end
#    if Organisation.equipment <= 40 & Organisation.equipment >= 30
#        equipment_score = 7
#    end
#    if Organisation.equipment <= 30 & Organisation.equipment >= 20
#        equipment_score = 6
#    end
#    if Organisation.equipment <= 20 & Organisation.equipment > 10
#        equipment_score = 5
#    end
#    if Organisation.amount < 10 
#        equipment_score = 4
#    end
#    
#  if Profile.tfrom < Organisation.tfrom
#    tfrom_score = 0
#  else if Profile.tfrom > Organisation.tfrom
#    tfrom_score = 10
#  else if Profile.tfrom = Organisation.tfrom
#    tfrom_score = 5
#  end
#    
#  if Profile.tto < Organisation.tto
#    tto_score = 0
#  else if Profile.tto > Organisation.tto
#    tto_score = 10
#  else if Profile.tto = Organisation.tto
#    tto_score = 5
#  end  
#   
#    score = (amount_score + equipment_score + tfrom_score +tto_score)*100/40
#    
#    
#  end          


end 