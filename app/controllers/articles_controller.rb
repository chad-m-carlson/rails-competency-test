class ArticlesController < ApplicationController
  access all: [:index,], user: [:show], editor: [:show, :create, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :create, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :verify_user_is_author, only: :update, message: "You are not the author"

  def index
    @articles = Article.all
  end

  def show

  end

  def new
    @article = @user.articles.new
  end

  def create
    @article = @user.articles.new(article_params)
    if @article.save
      flash[:success] = "Article Created"
      redirect_to article_path(@article.id)
    else
      flash[:error] = "Error #{@article.errors.full_messages.join(" ")}"
      redirect_to editors_control_panel_path
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:error] = "Article Deleted"
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

    def verify_user_is_author
      if @article.user_id != @user.id
        forbidden!
      end
    end
end
