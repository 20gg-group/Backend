class Detail < ApplicationRecord
	belongs_to :post
	has_one :detail , dependent: :destroy

	def convert_to_boolean(string)
	  case string
	  	when /^(true|t|yes|y|1)$/i then true
	  	when /^(false|f|no|n|0)$/i then false
	  else 
	  	raise "Cannot convert to boolean: #{string}"
	  end
	end
end
