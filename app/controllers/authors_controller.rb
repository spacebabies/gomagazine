class AuthorsController < ApplicationController
  def show
    @author = Author.find params[:id]
    @first_article = @author.articles.order(:created_at).first
    @last_article = @author.articles.order(:created_at).last
    fresh_when @author
  end
end
