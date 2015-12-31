class WelcomeController < ApplicationController
  def index
    @articles = Article.where(onhomepage: true)
  end
end
