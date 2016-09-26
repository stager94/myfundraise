class WalletoneMiddleware < Walletone::Middleware::Base
	
	W1_SECRET_KEY = Rails.application.secrets.w1_secret_key

	def perform notify, env
		p notify
		raise 'Wrong sign' unless notify.valid? W1_SECRET_KEY

		secret_key = notify[:DONATION_SECRET_KEY]
		donation = Donation.where(secret_key: secret_key).first

		raise 'Wrong donation' unless donation

		if notify.accepted?
			donation.pay!
		else
			donation.fail!
		end

		donation.update data: notify.as_json

		# TODO something with notify
		'Return some message for OK response'
	end
end
