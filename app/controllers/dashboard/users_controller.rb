class Dashboard::UsersController < ApplicationController
	
	def vk_photos
		use_case = ::Myfundraise::Profile::SocialPhotos::Vkontakte.new user_id: params[:id], count: params[:count], offset: params[:offset]
		@photos = use_case.fetch
	end

end
