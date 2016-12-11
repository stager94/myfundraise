class Dashboard::RewardsController < ApplicationController

  before_action :find_campaign

  def new
    @reward = @campaign.rewards.new
  end

  def create
    @campaign.rewards.create reward_params
    render 'reload'
  end

  def destroy
    @reward = Reward.find(params[:id]).destroy
    render 'reload'
  end

  private

  def find_campaign
    @campaign = Campaign.find params[:campaign_campaign_id]
  end

  def reward_params
    params.require(:reward).permit!
  end

end
