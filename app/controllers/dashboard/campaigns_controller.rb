class Dashboard::CampaignsController < ApplicationController

	before_action :load_campaign, only: [:show, :select_picture, :select_video, :prev_step, :next_step, :crop, :activate, :edit, :update, :destroy, :post_update]

	def new
		@show_promo = false
		@campaign = Campaign.new
	end

  def create
  	@show_promo = false
  	@campaign = current_user.campaigns.new permitted_params
	  if @campaign.save
	    redirect_to dashboard_campaign_steps_path(@campaign, id: :media)
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

	def select_video
		@campaign.update params.require(:campaign).permit(:video_url)
		if @campaign.video_url.present?
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

	def edit
	end

	def update

	end

	def destroy
		@campaign.destroy
		redirect_to root_path
	end

	def post_update
		@update = @campaign.updates.create params.require(:update).permit!
	end

private

	def permitted_params
		params.require(:campaign).permit!
	end

	def load_campaign
		@campaign = Campaign.find params[:campaign_id]
	end

end
