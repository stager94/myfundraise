class Dashboard::DonationsController < ApplicationController

	PAGE_SIZE = 20
	
	def index
		@donations = Donation.where(campaign_id: current_user.campaigns.pluck(:id))
												 .order(created_at: :desc)
												 .page(params[:page]).per PAGE_SIZE
	end

end
