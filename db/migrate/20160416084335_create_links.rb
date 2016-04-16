class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.uuid :traveller_id, foreign_key: true, index: true
      t.uuid :companion_id, foreign_key: true, index: true

      t.boolean :match_confirmed, default: false

      t.timestamps null: false
    end
  end
end
