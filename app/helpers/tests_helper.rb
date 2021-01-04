# module TestsHelper
#   TEST_LEVELS = { 0 => I18n.t('tests.levels.easy'),
#                   1 => I18n.t('tests.levels.normal'),
#                   2 => I18n.t('tests.levels.advanced'),
#                   3 => I18n.t('tests.levels.hard') }.freeze
#
#   def test_level(test)
#     TEST_LEVELS[test.level] || I18n.t('tests.levels.infernal')
#   end
# end

module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :normal, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    level = TEST_LEVELS[test.level] || :infernal
    I18n.t('tests.levels.' + level.to_s)
  end

  def test_levels_key(value)
    TEST_LEVELS.key(value)
  end
end
