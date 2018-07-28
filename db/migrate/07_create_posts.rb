class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :tittle
			t.float :price
			t.float :area
			t.text :decription
      t.datetime :date_post
      t.string :phone_contact_number
      t.integer :detail_ids, array: true, default: []

			#t.boolean :status # da ban hay chua ban/ da co thue hoac chua
			t.references :user, foreign_key: true
			

      t.timestamps
    end
  end
end
