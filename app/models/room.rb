class Room < ApplicationRecord
  belongs_to :hotel
  attribute :type, :string
  attribute :status, :string
  enum status: { available: 'available', booked: 'booked' }
   before_validation :ensure_room_has_a_status

   enum type: { single: 'single', double: 'double' }
   before_validation :ensure_room_has_a_type


   validates :status, presence: true
 
   private
   def ensure_room_has_a_status
     if status.blank?
       self.status = :available 
     end
   end   
   def ensure_room_has_a_type
    if type.blank?
      self.type = :single 
    end
  end   
end
