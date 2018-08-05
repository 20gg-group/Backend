class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :city
			t.string :district
			t.string :add_detail
			t.references :post  

      t.timestamps
    end
  end
end
