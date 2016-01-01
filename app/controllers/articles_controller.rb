class ArticlesController < ApplicationController
  def index
    @articletype = Articletype.find params[:articletype_id]
    @articles = @articletype.articles
  end

  def show
    @article = Article.find params[:id]
  end
end
