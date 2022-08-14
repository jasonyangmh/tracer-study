class Profile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :birthplace, presence: true
  validates :birthdate, presence: true
  validates :gender, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :major, presence: true
  validates :graduation_year, presence: true
end
