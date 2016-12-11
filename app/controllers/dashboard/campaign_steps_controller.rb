class Dashboard::CampaignStepsController < ApplicationController
	include Wicked::Wizard

	before_action :fetch_campaign

	prepend_before_action :set_steps

	def show
		@campaign.update_attribute :step, params[:id]
		@rewards = @campaign.rewards
		redirect_to @campaign and return if @campaign.step == 'activate' && !@campaign.is_draft?
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
		@show_promo = false
		@campaign = Campaign.find params[:campaign_id]
	end

end
