class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new
    @user.name = user_params[:name]
    @user.password = user_params[:password]
    @user.keywords = user_params[:keywords].gsub(/\s+/, "").split(",")

    if @user.save
      sign_in!(@user)
      redirect_to dashboard_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :keywords)
  end

end
