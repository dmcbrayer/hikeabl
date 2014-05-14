class ItemSubscription < ActiveRecord::Base
	belongs_to :item
	belongs_to :trip
end
