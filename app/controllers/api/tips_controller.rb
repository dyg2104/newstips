class Api::TipsController < ApplicationController
  before_filter require_signed_in!

  def index
    if params[:tip][:query]
      @tips = Tip.search_by_subject_and_text(params[:tip][:query])
    else
      @tips = Tip.all
    end

    render :index, status: :ok
  end

end
