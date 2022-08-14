require 'csv'

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
  validates :user_id, uniqueness: true

  def self.to_csv
    profiles = all
    CSV.generate do |csv|
      csv << column_names
      profiles.each do |profile|
        csv << profile.attributes.values_at(*column_names)
      end
    end
  end
end
