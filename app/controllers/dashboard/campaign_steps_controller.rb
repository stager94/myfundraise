class Dashboard::CampaignStepsController < ApplicationController
	include Wicked::Wizard

	before_action :fetch_campaign

	prepend_before_action :set_steps

	def show
		@campaign.update step: params[:id]
		render_wizard
	end

	def update
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

	def fetch_campaign
		@campaign = Campaign.find params[:campaign_id]
	end

end
