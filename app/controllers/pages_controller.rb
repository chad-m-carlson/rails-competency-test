class PagesController < ApplicationController
  access all: [:home,], editor: [:editors]

  def home
    @articles = []
    @categories = Article.distinct.pluck(:category)
    @categories.each do |c|
      Article.where(category: c).limit(3).each do |a|
        @articles << a
      end
    end
    render template: 'pages/home'
  end

  def editors
    render template: "pages/editors_control_panel"
  end

end
