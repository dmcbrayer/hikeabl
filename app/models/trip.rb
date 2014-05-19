class Trip < ActiveRecord::Base

	include PublicActivity::Model
	tracked owner: ->(controller, model) {controller && controller.current_user}

	belongs_to :user

	has_many :item_subscriptions
	has_many :items, :through => :item_subscriptions

	validates :name, presence: true
	validates_date :ends_on, :on_or_after => :starts_on, :on_or_after_message => 'must be on or after starts on date'


end



