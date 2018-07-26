class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
    	t.integer :no_people_per_room
    	t.string :gender

    	t.boolean :air_conditioner
    	t.boolean :washing_machine
    	t.boolean :refrigerator
    	t.boolean :WC
    	t.boolean :parking
    	t.boolean :Wifi
    	t.boolean :free_time
    	t.boolean :separated_owner
    	t.boolean :kitchen
    	t.boolean :bed
    	t.boolean :television
    	t.boolean :Wardrobe 
    	t.boolean :amezzanine
    	t.boolean :camera
    	t.boolean :security
    	t.boolean :pet

    	t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
