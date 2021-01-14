module TestsHelper
  def test_level(test)
    level = Test::LEVELS.key(test.level) || :infernal
    I18n.t('tests.levels.' + level.to_s)
  end
end
