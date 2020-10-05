class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :text, presence: true
  validates :answers, length: { in: 0..4 }

  default_scope { order(:id) }

  def text_html(n)
    n.to_s + '. ' + text.gsub("<pre>", "\n<pre>\n")
                        .gsub("</pre>", "\n</pre>")
                        .gsub("\\n", "\n")
  end
end
