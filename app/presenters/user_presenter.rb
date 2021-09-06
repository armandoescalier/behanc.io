class UserPresenter
  def initialize(user, current_user = nil)
    @user = user
    @current_user = current_user
  end

  def profile_picture
    @user.profile_picture.attached? ? @user.profile_picture : 'placeholder.jpg'
  end

  def current_user?
    @user.username == @current_user&.username
  end
end
