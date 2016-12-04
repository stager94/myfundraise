module ApplicationHelper

	def render_modal(id:, title: nil)
		body = render("shared/modals/#{id}/body") rescue nil
		footer = render("shared/modals/#{id}/footer") rescue nil

		render 'shared/modules/base_modal', id: id, title: title, body: body, footer: footer
	end

	def construct_amount(amount, currency)
		a = [currency.sign, number_with_delimiter(amount.to_i)]
		a.reverse! if currency.sign_after_amount?
		a.join
	end

	def render_notification(notification)
		render "shared/notifications/#{notification.key}", notification: notification
	end

	def campaign_page?
		params[:controller] == "campaigns" && params[:action] == "show"
	end

end
