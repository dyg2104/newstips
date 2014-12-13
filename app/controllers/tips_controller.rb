class TipsController < ApplicationController

  def new
    @tip = Tip.new
    render :new
  end

  def create
    @tip = Tip.new(tip_params)

    if @tip.save
      flash.now[:notices] = ['Tip succesfully submitted!']
    else
      flash.now[:notices] = @tip.errors.full_messages
    end

    render :new
  end

  private

  def tip_params
    params.require(:tip).permit(:name, :text, :email, :city, :state, :phone, :subject)
  end

end
