class ArticlesController < ApplicationController
  access all: [:index,], user: [:show], editor: [:show, :create, :edit, :destroy]
  before_action :set_user, only: [:show, :create, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :destroy]

  def index
    @articles = Article.all
  end

  def show

  end

  def new
    # @article = @user.articles.new
  end

  def create
    @article = @user.articles.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:category, :title, :content)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def set_user
      @user = current_user
    end
end
