class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class_name: "User"

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..) }
  scope :categories_title, -> (category) { 
    joins(:category)
   .where('categories.title LIKE ?', category)
   .order(title: :desc).pluck(:title)
  }
  scope :by_user_level, -> (user_id, level) {
    where(level: level).joins(:users).where(:'users.id' => user_id)
  }

  validates :title, presence: true 
  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level }
end
