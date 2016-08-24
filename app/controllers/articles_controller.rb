class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "ghl", password: "IPd7WXwl2FDkQV9e", except: [:show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

    def index
      @articles = Article.all.paginate(page: params[:page], per_page: 3)
    end

    def show
      # to show all post titles on show page
      @articles = Article.all
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to @article
      else
        render 'new'
      end
    end

    def update
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
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
