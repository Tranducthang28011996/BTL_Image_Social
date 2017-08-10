class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.references :photo, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :done, default: 0

      t.timestamps
    end
  end
end
