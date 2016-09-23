class User < ApplicationRecord
  has_secure_password
  
  has_many :profile
  has_many :organisation
  
  validates :first_name,
            presence: true
  validates :last_name,
            presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            }
            
         
            
  def to_s
    "#{first_name} #{last_name}"
  end   
  
  
  #Role definition
  #ROLES = [ :admin , :employee, :sproject, :support ]
  ROLES = %w[Admin Employee Sozial_Organisation Supporter].freeze
  ROLESA = %w[project support].freeze
  
  
  def is?( requested_role )
    self.role == requested_role.to_s
  end
  
  
end
