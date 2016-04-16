class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.belongs_to :user, foreign_key: true, index: true

      t.string   :session_token, index: true
      t.datetime :expires_at

      t.timestamps null: false
    end
  end
end
