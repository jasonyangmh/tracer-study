class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :type
      t.string :name
      t.string :position
      t.text :address
      t.date :start_date
      t.date :end_date
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
