class Trip < ActiveRecord::Base

	belongs_to :user

	has_many :item_subscriptions
	has_many :items, :through => :item_subscriptions

	validates :name, presence: true
	validate :date_validate

	def date_validate
		if :ends_on < :starts_on
			errors.add :base, "Your trip can't end before it starts"
		end

	end

end



