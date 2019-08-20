class UsersController < ApplicationController

  def create
    user = User.new user_params

    if user.save
      render(json: {user: user, status: 200}, status: 200)
    else
      render(json: {errors: user.errors.full_messages, status: 422}, status: 422)
    end
  end

  def current
    status = current_user ? 200 : 404
    render(json: {current_user: current_user, status: status}, status: status)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
