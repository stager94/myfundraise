module ApplicationHelper

	def render_modal(id:, title: nil)
		body = render("shared/modals/#{id}/body") rescue nil
		footer = render("shared/modals/#{id}/footer") rescue nil

		render 'shared/modules/base_modal', id: id, title: title, body: body, footer: footer
	end

end
