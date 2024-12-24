class Hotel < ApplicationRecord
    has_many :rooms, dependent: :destroy
    has_many :staffs, dependent: :destroy
    has_one_attached :image
  
    validates :name, :address, presence: true
end
