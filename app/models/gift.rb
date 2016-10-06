class Gift < ApplicationRecord
  
  validates :giftname,
          presence: true
          
  validates :heading,
          presence: true
  
  mount_uploader :image, GiftImageUploader

  
  
  
  #def remove_image=(val)
  #  image_will_change! if val
  #  super
  #end
  
 
end
