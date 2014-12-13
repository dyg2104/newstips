class TipsController < ApplicationController

  def new
    @tip = Tip.new
    render :new
  end

  def create
    @tip = Tip.new(tip_params)

    if @tip.save
      flash = ['Tip succesfully submitted!']
      redirect_to root_url
    else
      flash.now = @tip.errors.full_messages
      render :new
    end
  end

  private

  def tip_params
    params.require(:tip).permit(:name, :text, :email, :city, :state)
  end

end
