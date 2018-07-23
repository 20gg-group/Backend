class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :city
			t.string :district
			t.string :street
			t.integer :house_no
			t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
