class AdminUser < ApplicationRecord
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, as: :profileable, dependent: :destroy

  accepts_nested_attributes_for :profile
end
