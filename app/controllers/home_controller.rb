class HomeController < ApplicationController

  def index
    @articles = Article.order("created_at DESC").limit(4).all
  end
end
