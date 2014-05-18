class Trip < ActiveRecord::Base

	belongs_to :user

	has_many :item_subscriptions
	has_many :items, :through => :item_subscriptions

	validates :name, presence: true
	validates_date :ends_on, :on_or_after => :starts_on, :on_or_after_message => 'must be on or after starts on date'


end



