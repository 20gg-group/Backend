class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :full_name
      t.string :phone_number
      t.attachment :avatar
      t.integer :role , default: 0
    end
  end
end
