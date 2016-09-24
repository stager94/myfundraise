class Dashboard::CampaignStepsController < ApplicationController
	include Wicked::Wizard

	prepend_before_action :set_steps

	def show
		@campaign = Campaign.find params[:campaign_id]
		render_wizard
	end

	def update
		@campaign = Campaign.find params[:campaign_id]
	  @campaign.attributes = permitted_params
	  render_wizard @campaign
	end

private

	def set_steps
		self.steps = Campaign::STEPS
	end

	def permitted_params
		params.require(:campaign).permit!
	end

end
