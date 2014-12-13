class Api::UserSavesController < ApplicationController
  before_filter require_signed_in!

  def create
    tip_id = params[:user_save][:tip_id]

    if Tip.exists?(id: tip_id)
      @user_save = current_user.user_saves.build(user_save_params)

      if @user_save.save
        render :show, status: :ok
      else
        render json: { errors: @user_save.errors.full_messages },
          status: :unprocessable_entity
      end

    else
      render nothing: true, status: :not_found
    end
  end

  def destroy
    @user_save = UserSave.find(params[:id])

    if @user_save.user == current_user
      if @user_save.destroy
        render :show, status: :ok
      else
        render json: { errors: @project_share.errors.full_messages },
          status: :unprocessable_entity
      end
    else
      render nothing: true, status: :forbidden
    end
  end

  private

  def user_save_params
    params.require(:user_save).permit(:tip_id)
  end

end
