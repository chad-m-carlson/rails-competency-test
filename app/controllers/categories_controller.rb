class CategoriesController < ApplicationController
  access [:user, :editor, :admin] =>  [:show]

  def show
    @articles = Article.where(category: params[:id])
  end

end
