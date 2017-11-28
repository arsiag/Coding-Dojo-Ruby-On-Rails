class UsersController < ApplicationController

  def index
    @users = User.all
    render layout: "two_column"
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to "/users"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users"
      # redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :favorite_language)
    end
end
