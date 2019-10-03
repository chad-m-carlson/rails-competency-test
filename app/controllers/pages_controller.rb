class PagesController < ApplicationController
  access all: [:home,], editor: [:editors], admin: [:administrator]

  def home
    @articles = []
    @categories = Article.category_options
    @categories.each do |c|
      Article.where(category: c).limit(3).order(updated_at: :desc).each do |a|
        @articles << a
      end
    end
    render 'pages/home'
  end

  def editors
    @article = current_user.articles.new
    @articles = Article.where(user_id: current_user.id).paginate(:page => params[:page])
    render "pages/editors_control_panel"
  end

  def administrator
    render 'pages/admin_control_panel'
  end

end
