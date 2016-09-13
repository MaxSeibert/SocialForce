class Profile < ApplicationRecord

  validates :name,
            presence: true
  validates :location,
            presence: true
  validates :impactfocus,
            presence: true

end