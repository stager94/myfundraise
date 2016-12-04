class LikesController < ApplicationController

	def create
		return unless user_signed_in?
		@likeable = find_likeable
		@likeable_class = @likeable.class.name.underscore
		@like = @likeable.likes.by_user(current_user).first

		if @like.present?
			@like.destroy
		else
			@likeable.likes.create user_id: current_user.id
		end
		@likeable.reload
	end

private

	def find_likeable
		params.each do |name, value|
			if name =~ /(.+)_id$/
				m = $1 == 'article' ? 'blog/article' : $1
				return m.classify.constantize.find(value)
			end
		end
		nil
	end

end
