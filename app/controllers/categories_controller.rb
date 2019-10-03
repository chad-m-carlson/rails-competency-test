class CategoriesController < ApplicationController
  access [:user, :editor, :admin] =>  [:show]

  def show
    @articles = Article.where(category: params[:id]).order(updated_at: :desc)
  end

end
