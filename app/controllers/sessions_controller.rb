class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by(name: params[:session][:name])

    if user.authenticate(params[:session][:password])
      sign_in!(user)
      redirect_to dashboard_url
    else
      flash.now[:notices] = ['Invalid username/password combination']
      render :new
    end
  end

  def destroy
    sign_out!
    render nothing: true, status: :ok
  end

end
