class UsersController < ApplicationController
  def follow
    @user = User.find(params[:id])
    current_user.followings << @user
    redirect_back(fallback_location: profile_path(@user))
    flash[:notice] = "Now you follow #{@user.username}"
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.given_follows.find_by(followed_user_id: @user.id).destroy
    redirect_back(fallback_location: profile_path(@user))
    flash[:notice] = "You have unfollow #{@user.username}"
  end
end
