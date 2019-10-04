require 'spec_helper'
require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'attributes' do
    it 'has a category' do
      category = 'Current Events'
      article = Article.create(category: category)
      expect(article.category).to eq(category)
    end

    it 'has a title' do
      title = 'Article Title'
      article = Article.create(title: title)
      expect(article.title).to eq(title)
    end

    it 'has content' do
      content = 'Some Content'
      article = Article.create(content: content)
      expect(article.content).to eq(content)
    end
  end

  describe 'validations' do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:category)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:content)}
  end

  describe 'associations' do
    it {should belong_to(:user)}
  end

  describe 'class methods' do
    before(:each) do
      @user = FactoryBot.create(:user)
      @article1 = FactoryBot.create(:article, user_id: @user.id)
      @article2 = FactoryBot.create(:article, user_id: @user.id, category: "Current Events")
      @article3 = FactoryBot.create(:article, user_id: @user.id, category: "International news")
    end
    it 'returns an array of categories' do
      array = Article.category_options
      expect(array).to eq([@article1.category, @article2.category, @article3.category].sort)
    end
  end

end