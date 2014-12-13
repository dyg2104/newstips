require 'json'

class Api::RelatedArticlesController < ApplicationController

  def index
    city, subject = params[:city], params[:subject]
    @related_articles = Nyt.invoke(city: city, subject: subject)['response']
  end

end
