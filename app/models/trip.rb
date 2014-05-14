class Trip < ActiveRecord::Base
	belongs_to :user

	has_many :item_subscriptions
	has_many :items, :through => :item_subscriptions
end
