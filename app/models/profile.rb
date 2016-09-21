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
  
 # regex = /\A(?:(?:(?:(?:0?[13578])|(1[02]))/31/(19|20)?\d\d)|(?:(?:(?:0?[13-9])|(?:1[0-2]))/(?:29|30)/(?:19|20)?\d\d)|(?:0?2/29/(?:19|20)(?:(?:[02468][048])|(?:[13579][26])))|(?:(?:(?:0?[1-9])|(?:1[0-2]))/(?:(?:0?[1-9])|(?:1\d)|(?:2[0-8]))/(?:19|20)?\d\d))\Z/
 # validates_format_of :tfrom,
 #           :with => /\d{2}.\d{2}.\d{4}/,
 #           :message => "Date must be in the following format: mm.dd.yyyy"
 
  validates :tfrom, 
            date: true,         
            allow_blank: true
            
  validates :tto, 
            date: true,         
            allow_blank: true
            
  validates :resources, 
            presence: true         

end