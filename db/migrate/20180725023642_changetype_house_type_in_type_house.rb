class ChangetypeHouseTypeInTypeHouse < ActiveRecord::Migration[5.2]
  def change
  	def self.up
    	change_column :type_houses, :type_house, :type_of_house
  	end
 
  	def self.down
    	change_column :type_houses, :type_house, :string
  	end
  end
end
