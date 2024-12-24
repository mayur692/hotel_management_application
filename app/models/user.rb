class User < ApplicationRecord
   # Devise modules for authentication
   devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

   enum role: { guest: 'guest', admin: 'admin' }
   before_validation :ensure_user_has_a_role

   
   validates :name, presence: true
   validates :role, presence: true

   after_create :send_welcome_email
 
 
   has_many :managed_hotels, class_name: 'Hotel', foreign_key: 'staff_id', dependent: :nullify
   private
   def ensure_user_has_a_role
     if role.blank?
       self.role = :guest 
     end
   end   

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
