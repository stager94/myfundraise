class Dashboard::CampaignStepsController < ApplicationController
	include Wicked::Wizard
	# steps :details, :media, :description, :share, :contacts_invite, :share_on_fb, :link
	steps :media, :description, :share, :link

	def show
		@body_class = "gray"
		@campaign = Campaign.find params[:campaign_id]
		render_wizard
	end

	def update
		@campaign = Campaign.find params[:campaign_id]
	  @campaign.attributes = params[:campaign]
	  render_wizard @campaign
	end
end
