class Test < ApplicationRecord
  LEVELS = { easy: 0, normal: 1, advanced: 2, hard: 3 }.freeze

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy
  belongs_to :category
  belongs_to :author, class_name: "User"

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }
  scope :by_category, -> (category_title) { 
    joins(:category).where('categories.title LIKE ?', category_title)
  }
  scope :level, -> (level) { where(level: level) }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level }

  def self.titles_by_category(category_title)
    by_category(category_title).order(title: :desc).pluck(:title)
  end
end
