class Dashboard::RewardsController < ApplicationController

  before_action :find_campaign
  before_action :find_reward

  def index
  end

  def create
    @reward.update reward_params
  end

  private

  def find_campaign
    @campaign = Campaign.find params[:campaign_campaign_id]
  end

  def find_reward
    @reward = @campaign.reward || @campaign.build_reward
  end

  def reward_params
    params.require(:reward).permit!
  end

end
