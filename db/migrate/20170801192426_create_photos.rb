class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :status, default: 1;
      t.integer :deleted, default: 0;
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
