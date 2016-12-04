class CommentsController < ApplicationController

	def create
		return unless user_signed_in?
		@commentable = find_commentable
		@commentable_class = @commentable.class.name.underscore
		@comment = @commentable.comments.create permitted_params.merge(system_params)
	end

	def index

	end

private

	def permitted_params
		params.require(:comment).permit :text
	end

	def system_params
		{ user_id: current_user.id }
	end

	def find_commentable
		params.each do |name, value|
			if name =~ /(.+)_id$/
				m = $1 == 'article' ? 'blog/article' : $1
				return m.classify.constantize.find(value)
			end
		end
		nil
	end

end
