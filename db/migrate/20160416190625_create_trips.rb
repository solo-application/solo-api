class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.uuid :user_id, foreign_key: true, index: true

      t.string :country_name
      t.string :hotel
      t.string :transport
      t.string :start_date
      t.boolean :complete, default: false

      t.timestamps null: false
    end
  end
end
