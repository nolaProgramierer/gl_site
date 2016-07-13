class CommentsController < ApplicationController
  before_action :find_article_id, only: [:create, :destroy]

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
      params.require(:comment).permit(:commenter, :body, :parent_id)
    end

    def find_article_id
      @article = Article.find(params[:article_id])
    end
end
