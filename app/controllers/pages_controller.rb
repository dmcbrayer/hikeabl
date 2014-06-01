class PagesController < ApplicationController
  def home
  	if user_signed_in?
  		followees_ids = current_user.followees(User)
  	end
  	@activities = PublicActivity::Activity.where(owner_id: followees_ids, owner_type: "User").order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end

  def about
  end
end
