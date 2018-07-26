class AdddDefultValueToDetails < ActiveRecord::Migration[5.2]
  def change
  	change_column :details, :air_conditioner, :boolean, default: false
  	change_column :details, :washing_machine, :boolean, default: false
  	change_column :details, :refrigerator, :boolean, default: false
  	change_column :details, :WC, :boolean, default: false
  	change_column :details, :parking, :boolean, default: false

  	change_column :details, :Wifi, :boolean, default: false
  	change_column :details, :free_time, :boolean, default: false
  	change_column :details, :separated_owner, :boolean, default: false
  	change_column :details, :kitchen, :boolean, default: false
  	change_column :details, :bed, :boolean, default: false
  	
  	change_column :details, :television, :boolean, default: false
  	change_column :details, :Wardrobe, :boolean, default: false
  	change_column :details, :amezzanine, :boolean, default: false
  	change_column :details, :camera, :boolean, default: false
  	change_column :details, :security, :boolean, default: false
  	change_column :details, :pet, :boolean, default: false
  end
end
