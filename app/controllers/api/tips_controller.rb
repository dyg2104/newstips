class Api::TipsController < ApplicationController
  before_filter require_signed_in!

  def index
    @tips = Tip.all
    render :index, status: :ok
  end

end
