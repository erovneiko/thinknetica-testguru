class Badge < ApplicationRecord
  has_many :awards, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :rule, presence: true, uniqueness: true

  def self.award_rules
    [
      I18n.t('activerecord.attributes.badge.rule_1'),
      I18n.t('activerecord.attributes.badge.rule_2'),
      I18n.t('activerecord.attributes.badge.rule_3'),
      I18n.t('activerecord.attributes.badge.rule_4'),
      I18n.t('activerecord.attributes.badge.rule_5')
    ]
  end
end
