class PagesController < ApplicationController
  before_filter :require_signed_in!

  def dashboard
    render :dashboard
  end

end
