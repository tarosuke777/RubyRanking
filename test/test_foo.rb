# frozen_string_literal: true

require 'test/unit'
require '../lib/main'

class TcMain < Test::Unit::TestCase
  def setup
    @obj = Main.new
  end

  # def teardown
  # end

  def test_foo
    out = File.read('../testdata/ranking/out/success.csv')
    assert_equal(out, @obj.foo)
  end

  def test_bar
    assert_equal('bar', @obj.bar)
  end
end
