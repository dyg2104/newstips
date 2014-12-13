class PagesController < ApplicationController
  before_filter :require_signed_in!

  def dashboard
    @tips = []

    current_user.keywords.each do |keyword|
      @tips << Tip.search_by_subject_and_text(keyword)
    end

    @tips.uniq!
    render :dashboard
  end

end
