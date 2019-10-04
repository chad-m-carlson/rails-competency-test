class Article < ApplicationRecord
  belongs_to :user
  validates :category, presence: true
  validates :title, presence: true
  validates :content, presence: true

  def self.category_options
    Article.distinct.order(:category).pluck(:category)
  end
end
