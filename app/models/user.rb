class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
  
    has_many :passport_statuses, dependent: :destroy
    has_many :addresses, dependent: :destroy
  
    def current_passport_statuses
      passport_statuses.order(created_at: :desc).first
    end
  end
  