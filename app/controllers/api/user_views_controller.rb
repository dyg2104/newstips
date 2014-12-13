class Api::UserViewsController < ApplicationController
  before_filter require_signed_in!

  def create
    tip_id = params[:user_view][:tip_id]

    if Tip.exists?(id: tip_id)
      @user_save = current_user.user_view.build(user_view_params)

      if @user_view.save
        render :show, status: :ok
      else
        render json: { errors: @user_view.errors.full_messages },
          status: :unprocessable_entity
      end

    else
      render nothing: true, status: :not_found
    end
  end

  private

  def user_view_params
    params.require(:user_view).permit(:tip_id)
  end

end
