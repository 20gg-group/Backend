class CreateTypeHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :type_houses do |t|
      t.string :type_house 
      t.timestamps
    end
  end
end
