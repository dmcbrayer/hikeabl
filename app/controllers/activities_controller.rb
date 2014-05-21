class ActivitiesController < ApplicationController
  def index
  	followees_ids = current_user.followees(User)
  	@activities = PublicActivity::Activity.where(owner_id: followees_ids, owner_type: "User").order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end
end
