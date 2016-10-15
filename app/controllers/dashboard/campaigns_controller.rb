class Dashboard::CampaignsController < ApplicationController

	before_action :load_campaign, only: [:show, :select_picture, :prev_step, :next_step, :crop, :activate]

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
		if params[:type] == "regular"
			@campaign.update params.require(:campaign).permit(:picture)
		else
			@campaign.update remote_picture_url: params[:url]
		end

		if @campaign.picture.present?
			@campaign.next_step!
			redirect_to dashboard_campaign_steps_path(campaign_id: @campaign.id, id: @campaign.current_step)
		else
			redirect_to dashboard_campaign_steps_path(campaign_id: @campaign.id, id: "media")
		end
	end

	def next_step
		@campaign.next_step!
		redirect_to dashboard_campaign_steps_path(campaign_id: @campaign.id, id: @campaign.current_step)
	end

	def prev_step
		@campaign.prev_step!
		redirect_to dashboard_campaign_steps_path(campaign_id: @campaign.id, id: @campaign.current_step)
	end

	def crop
		@campaign.update permitted_params
		redirect_to dashboard_campaign_steps_path(campaign_id: @campaign.id, id: "media_confirm")
	end

	def activate
		@campaign.update is_draft: false
		@campaign.next_step!
		redirect_to @campaign
	end

private

	def permitted_params
		params.require(:campaign).permit!
	end

	def load_campaign
		@campaign = Campaign.find params[:campaign_id]
	end

end
