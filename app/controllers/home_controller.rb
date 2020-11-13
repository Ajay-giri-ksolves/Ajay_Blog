class HomeController < ApplicationController
  def index
    @articles = Article.includes(:user)

  end
end
