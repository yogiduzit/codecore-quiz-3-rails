class UsersController < ApplicationController

  def create
    user = User.new user_params

    if user.save
      render(json: {user: user, status: 200}, status: 200)
    else
      render(json: {errors: user.errors.full_messages, status: 422}, status: 422)
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
