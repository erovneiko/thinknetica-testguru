class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class_name: "User"

  def self.get_names(category)
    Test.joins(:category).where('categories.title LIKE ?', category)
    .order(title: :desc).pluck(:title)
  end
end
