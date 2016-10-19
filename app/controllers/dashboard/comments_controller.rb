class Dashboard::CommentsController < ApplicationController

	PAGE_SIZE = 20
	
	def index
		@notifications = PublicActivity::Activity.where(recipient_id: current_user.id, recipient_type: "User")
																						 .order(created_at: :desc)
																						 .page(params[:page]).per PAGE_SIZE
	end

end
