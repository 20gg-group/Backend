class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
    	t.integer :no_people_per_room
    	t.string :gender

    	t.boolean :air_conditioner, default: false
    	t.boolean :washing_machine, default: false
    	t.boolean :refrigerator, default: false
    	t.boolean :wc, default: false
    	t.boolean :parking, default: false
    	t.boolean :Wifi, default: false
    	t.boolean :free_time, default: false
    	t.boolean :separated_owner, default: false
    	t.boolean :kitchen, default: false
    	t.boolean :bed, default: false
    	t.boolean :television, default: false
    	t.boolean :wardrobe, default: false
    	t.boolean :amezzanine, default: false
    	t.boolean :camera, default: false
    	t.boolean :security, default: false
    	t.boolean :pet, default: false

    	t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
