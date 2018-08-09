class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
			t.float :price
			t.float :area
			t.text :description
      t.datetime :date_post
      t.string :phone_contact_number
      t.integer :type_house # 0=> room_for_rent , 1=> room_graft
      t.string :detail_ids, array: true, default: []
      t.integer :sex
      t.integer :quantity
      t.string :category
			t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
