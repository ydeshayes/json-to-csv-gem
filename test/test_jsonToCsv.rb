require 'minitest/autorun'
require 'jsonToCsv'

class HolaTest < Minitest::Test
  def test_extractKeys_simple
    assert_equal ["foo", "bar"],
      JsonToCsv.extractKeys({ "foo" => 10, "bar" => 6 })
  end

  def test_extractKeys_nested
    assert_equal ["foo.test", "bar"],
      JsonToCsv.extractKeys({ "foo" => { "test" => 10}, "bar" => 6 })
  end

  def test_extractValues
    assert_equal ["foo", "bar", "foo,bar"],
      JsonToCsv.extractValues({ "foo" => "foo", "bar" => "bar", "foo2" => { "bar" => ["foo", "bar"]}})
  end

  def test_convert
    assert_equal File.read("test/test.csv"),
      JsonToCsv.convert(File.read("test/test.json"))
  end
end
