class Api::TipsController < ApplicationController
  before_filter :require_signed_in!

  def index
    if params[:query]
      @tips = Tip.search_by_subject_and_text(params[:query])
    else
      @tips = Tip.all
    end

    render :index, status: :ok
  end

end
