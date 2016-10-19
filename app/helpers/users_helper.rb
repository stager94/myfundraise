module UsersHelper

	def render_user_avatar_for(user = User.anonym, image_styles: "", fake_styles: "")
		user = User.anonym unless user
		if user.foto.present?
			image_tag user.foto.url(:medium), class: image_styles
		else
			render 'users/default_avatar', user: user, styles: fake_styles
		end
	end

end
