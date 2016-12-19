class Dashboard::NotificationsController < ApplicationController

	PAGE_SIZE = 20

	POSSIBLE_TABS = %w(all donation comment like)

	def index
		@tab = current_tab
		scope = PublicActivity::Activity.where(recipient_id: current_user.id, recipient_type: "User")
		scope = scope.where "key ILIKE ?", "#{@tab}.%" if @tab != POSSIBLE_TABS.first

		@notifications = scope.order(created_at: :desc).page(params[:page]).per PAGE_SIZE
	end

private

	def current_tab
		POSSIBLE_TABS.include?(params[:tab]) ? params[:tab] : POSSIBLE_TABS.first
	end

end
