class CampaignsController < ApplicationController

	impressionist

	def show
    @show_promo = false
		@body_class = "gray-striped-inverse" if params[:ik_inv_st] != 'success'
		@campaign = Campaign.find params[:id]

		@donations = @campaign.donations.paid.order(created_at: :desc).page 1
		@comments = @campaign.comments.order created_at: :desc
		impressionist @campaign
		@campaign.update_rating
	end

end
