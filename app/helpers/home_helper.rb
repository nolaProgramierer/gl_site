module HomeHelper

  # find last 4 articles sorted by oldest to most recent for display in home page blog view
  def article_helper(index)
    @articles = Article.order('created_at DESC').first(4)
    @article = @articles.fetch(index)
  end

  # find title of last four articles in db
  def blog_title(index)
    @articles = Article.order('created_at DESC').first(4)
    @article = @articles.fetch(index)
    @article.title.html_safe
  end

  # return first 100 chars of the last four articles in db
  def blog_text_teaser(index)
    @articles = Article.order('created_at DESC').first(4)
    @article = @articles.fetch(index)
    truncate(strip_tags(@article.text), length: 100, separator: " ")
  end
end
