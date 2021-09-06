class ProfileController < ApplicationController
  def show
    @user = User.find_by_username(params[:username])
    @presenter = UserPresenter.new(@user, current_user)

    redirect_to root_path, flash: { alert: "The user #{params[:username]} was not found" } unless @user
  end
end
