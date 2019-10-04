require 'spec_helper'
require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'attributes' do
    it 'has a category' do
      category = 'Current Events'
      article = Article.create(category: category)
      expect(article.category).to eq(category)
    end
  end
end