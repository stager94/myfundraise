class WithdrawsController < ApplicationController

  def create
    campaign = Campaign.find params[:campaign_id]
    withdraw = Withdraw.create campaign_id: campaign.id,
                               amount: campaign.to_withdraw
    redirect_to :back
  end

  def new

  end

end
