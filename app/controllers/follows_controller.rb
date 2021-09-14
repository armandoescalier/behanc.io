class FollowsController < ApplicationController
  before_action :set_user

  def create
    current_user.followings << @user
    flash[:notice] = "Now you follow #{@user.username}"
    return redirect_back(fallback_location: profile_path(@user)) unless current_user.followings.exclude?(@user)
  end

  def destroy
    current_user.given_follows.find_by(followed_user_id: @user.id).destroy
    flash[:notice] = "You have unfollow #{@user.username}"
    return redirect_back(fallback_location: profile_path(@user)) unless current_user.followings.include?(@user)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
