class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :notify_type
      t.integer :entity_id
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
