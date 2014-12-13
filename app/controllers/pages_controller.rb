class PagesController < ApplicationController
  before_filter :require_signed_in!, only: :dashboard

  def home
    render :home
  end

  def dashboard
    render :dashboard
  end

end
