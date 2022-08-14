require 'csv'

class Status < ApplicationRecord
  belongs_to :user

  def self.to_csv
    statuses = all
    CSV.generate do |csv|
      csv << column_names
      statuses.each do |status|
        csv << status.attributes.values_at(*column_names)
      end
    end
  end
end
