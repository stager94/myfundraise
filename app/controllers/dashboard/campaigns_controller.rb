class Dashboard::CampaignsController < ApplicationController

	def new
		@body_class = "gray"
		@campaign = Campaign.new
	end
  
  def create
  	@campaign = current_user.campaigns.new permitted_params
	  if @campaign.save
	    session[:campaign_id] = @campaign.id
	    redirect_to [:dashboard, @campaign]
	  else
	  	@body_class = "gray"
	    render :new
	  end
  end

  def show
  	@campaign = Campaign.find params[:campaign_id]
  	redirect_to dashboard_campaign_steps_path(@campaign)
  end

private

	def permitted_params
		params.require(:campaign).permit!
	end

end
