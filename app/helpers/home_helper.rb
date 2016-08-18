module HomeHelper

  # find last 4 articles sorted by oldest to most recent for display in home page blog view
  def article_helper(index)
    @articles = Article.order('created_at DESC').first(4)
    @article = @articles.fetch(index)
  end
end
