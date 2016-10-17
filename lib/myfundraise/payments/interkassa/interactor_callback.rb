module Myfundraise
	module Payments
		module Interkassa
			class InteractorCallback
				
				attr_accessor :params

				def initialize(p)
					@params = p[:params]
				end

				def run!
					@payment = create_payment
					donation.pay! if is_success? && !donation.paid?
					donation.fail! if is_failed? && !donation.failed?
				end

			private

				def donation
					@_donation ||= Donation.find_by secret_key: params[:ik_pm_no]
				end

				def create_payment
					Payment.create donation_id: donation.id, params: params, is_success: is_success?
				end

				def is_success?
					params[:ik_inv_st] == "success"
				end

				def is_failed?
					%w(canceled fail).include? params[:ik_inv_st]
				end

			end
		end
	end
end
