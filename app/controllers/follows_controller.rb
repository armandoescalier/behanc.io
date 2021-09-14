class FollowsController < ApplicationController
  before_action :set_user

  def create
    if current_user.followings.exclude?(@user)
      current_user.followings << @user
      flash[:notice] = "Now you follow #{@user.username}"
    else
      flash[:alert] = "You already follow #{@user.username}"
    end

    redirect_back(fallback_location: profile_path(@user))
  end

  def destroy
    if current_user.followings.include?(@user)
      current_user.given_follows.find_by(followed_user_id: @user.id).destroy
      flash[:notice] = "You have unfollowed #{@user.username}"
    else
      flash[:alert] = "You are not following #{@user.username}"
    end

    redirect_back(fallback_location: profile_path(@user))
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
