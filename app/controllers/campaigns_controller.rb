class CampaignsController < ApplicationController

	impressionist

	def show
		@body_class = "gray-striped-inverse"
		@campaign = Campaign.find params[:id]

		@donations = @campaign.donations.paid.order(created_at: :desc).first(10)
		@comments = @campaign.comments.order created_at: :desc
		impressionist @campaign
	end

end
