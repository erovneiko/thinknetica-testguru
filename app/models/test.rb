class Test < ApplicationRecord
  belongs_to :category

  def self.get_names(category)
    Test.joins(:category).where('categories.title LIKE ?', category)
    .order(title: :desc).pluck(:title)
  end
end
