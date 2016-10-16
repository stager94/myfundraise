class UsersController < ApplicationController

	before_action :set_user, only: [:finish_signup, :show]
	skip_before_filter :check_user_verifying, only: :finish_signup

  POSSIBLE_FILTERS = %w(active successfull drafts favourites)
  DEFAULT_FILTER = "active"

  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        # @user.skip_reconfirmation!
        sign_in(@user, bypass: true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  def show
    scope = Campaign
    @filter = DEFAULT_FILTER
    @filter = params[:filter] if POSSIBLE_FILTERS.include?(params[:filter])

    if @filter != "favourites"
      @campaigns = scope.send(@filter).by_author(@user).page params[:page]
    else
      @campaigns = scope.favourites(@user).page params[:page]
    end
  end

private

	def set_user
    @user = User.find(params[:id])
  end

  def user_params
    accessible = [ :first_name, :last_name, :email ] # extend with your own params
    accessible << [ :password, :password_confirmation, :current_password ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end

end
