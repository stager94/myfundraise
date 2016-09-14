module Myfundraise
	module Profile
		module SocialPhotos
			class Vkontakte

				attr_accessor :user_id, :offset, :count

				def initialize(user_id:, offset: nil, count: 10)
					@user_id = user_id
					@offset  = offset
					@count   = count
				end
				
				def fetch
					return { error: "Invalid params" } unless valid?
					photos
				end

			private

				def client
					@_vk_client ||=  VkontakteApi::Client.new
				end

				def user
					@_user ||= User.find_by_id user_id
				end

				def identity
					@_identity ||= user.identities.vk.first
				end

				def valid?
					user && identity
				end

				def photos
					client.photos.getAll(params)[1..-1]
				end

				def params
					{
						owner_id: identity.uid,
						access_token: identity.token,
						count: count || 10,
						offset: offset || 0
					}
				end

			end
		end
	end
end
