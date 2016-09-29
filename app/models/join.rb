class Join < ActiveRecord::Base
	# x``self.table_name = :users_pets
	belongs_to :users
	belongs_to :pets
end
