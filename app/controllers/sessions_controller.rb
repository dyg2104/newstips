class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:session][:name])

    if @user.authenticate(params[:session][:password])
      sign_in!(@user)
      render :show
    else
      render json: { errors: 'Invalid credentials' }, status: :unauthorized
    end
  end

end
