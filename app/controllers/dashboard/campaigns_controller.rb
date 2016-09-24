class Dashboard::CampaignsController < ApplicationController

	before_action :load_campaign, only: [:show, :select_picture]

	def new
		@campaign = Campaign.new
	end
  
  def create
  	@campaign = current_user.campaigns.new permitted_params
	  if @campaign.save
	    session[:campaign_id] = @campaign.id
	    redirect_to [:dashboard, @campaign]
	  else
	    render :new
	  end
  end

  def show
  	redirect_to dashboard_campaign_steps_path(@campaign)
  end

	def select_picture
		@campaign.photo_from_url params[:url]

		if @campaign.photo
			@campaign.next_step!
			redirect_to dashboard_campaign_steps_path(campaign_id: @campaign.id, id: @campaign.current_step)
		else
			redirect_to dashboard_campaign_steps_path(campaign_id: @campaign.id, id: "media")
		end
	end

private

	def permitted_params
		params.require(:campaign).permit!
	end

	def load_campaign
		@campaign = Campaign.find params[:campaign_id]
	end

end
