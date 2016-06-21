class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update,:destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.create(article_params)
    @article.save

    redirect_to article_path(@article)
  end

  def update
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

    private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def find_article
      @article = Article.find(params[:id])
    end
end
