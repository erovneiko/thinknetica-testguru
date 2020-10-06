module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :normal, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :infernal
  end
end
