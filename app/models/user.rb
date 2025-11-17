class User < ApplicationRecord
    #has_secure_password
    validates :email, presence: true, uniqueness: true

    has_many :passport_statuses, dependent: :destroy

    def current_passport_statuses
        passport_statuses.order(date_created: :desc).first
    end


=begin
    def add_passport_statuses(name)
        passport_statuses.create!(name: name, date_created: Time.current)
    end
=end
end
