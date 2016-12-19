class WithdrawsController < ApplicationController

  def create
    @campaign = Campaign.find params[:campaign_id]
    @withdraw = @campaign.withdraws.create withdraw_params

    if @withdraw.valid?
      redirect_to withdraws_users_path
    else
      render :new
    end
  end

  def new
    @campaign = Campaign.find params[:campaign_id]
    @withdraw = Withdraw.new
  end

  private

  def withdraw_params
    params.require(:withdraw).permit!
  end

end
