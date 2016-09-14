class Api::V1::UsersController < ApplicationController
	
	def vk_photos
		use_case = ::Myfundraise::Profile::SocialPhotos::Vkontakte.new user_id: params[:id]
		render json: use_case.fetch
	end

end
