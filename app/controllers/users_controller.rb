class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        render 'new'
      end
    end

    private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

      # Controller test for logged in users to prevent pages from being viewed
    def require_login
      if current_user.nil?
        redirect_to login_path
      end
    end
end
