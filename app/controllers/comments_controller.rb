class CommentsController < ApplicationController
  before_action :find_article_id, only: [:create, :destroy]

  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

    def find_article_id
      @article = Article.find(params[:article_id])
    end
end
