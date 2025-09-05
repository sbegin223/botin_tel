class User < ApplicationRecord
    has_many :user_roles, dependent: :destroy
    has_many :roles, through: :user_roles
    
    has_many :phones, dependent: :destroy
    accepts_nested_attributes_for :phones, allow_destroy: true, reject_if: ->(attrs) { attrs['number'].blank? }

    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create
end
