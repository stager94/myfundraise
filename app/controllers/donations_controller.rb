class DonationsController < ApplicationController

	W1_SECRET_KEY = Rails.application.secrets.w1_secret_key

	before_action :fetch_campaign, except: [:check, :test]

	def create
		@donation = Donation.new permitted_params.merge(default_params)

		if @donation.save
			run_payment_flow
		else
			render :new
		end
	end

	def new
		@donation = Donation.new amount: params[:amount]
	end

	def check
		p params
		Myfundraise::Payments::Interkassa::InteractorCallback.new(params: params).run!
		render text: ""
	end

	def load_more
		@donations = @campaign.donations.page params[:page]
	end

private

	def fetch_campaign
		@campaign = Campaign.find params[:id]
	end

	def permitted_params
		params.require(:donation).permit :amount, :message, :anonymous, :name, :email
	end

	def default_params
		{ user_id: current_user.try(:id), campaign_id: @campaign.id, currency_id: @campaign.currency.id }
	end

	def run_payment_flow
		# payment = Walletone::Payment.new(
		# 	WMI_MERCHANT_ID:    Rails.application.secrets.w1_merchant_id,
		# 	WMI_PAYMENT_AMOUNT:  @donation.amount,
		# 	WMI_CURRENCY_ID:     @donation.currency.wallet_one_id,
		# 	WMI_SUCCESS_URL: root_url,
		# 	DONATION_SECRET_KEY: @donation.secret_key
		# )
		# payment.sign! W1_SECRET_KEY

		# render locals: { form: payment.form }
	end

end
