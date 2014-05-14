class Item < ActiveRecord::Base
	has_many :item_subscriptions
	has_many :trips, :through => :item_subscriptions

	validates :name, presence: true

end
