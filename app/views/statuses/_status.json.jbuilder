json.extract! status, :id, :type, :name, :position, :address, :start_date, :end_date, :comment, :user_id, :created_at, :updated_at
json.url status_url(status, format: :json)
