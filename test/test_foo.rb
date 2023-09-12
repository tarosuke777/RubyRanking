# frozen_string_literal: true

require 'minitest/autorun'
require '../lib/main'

class TcMain < MiniTest::Test
  def setup
    @obj = Main.new
  end

  def teardown
  end

  def test_foo
    out = File.read('../testdata/ranking/out/success.csv')
    assert_output(out) { @obj.foo }
  end

  def test_bar
    assert_equal('bar', @obj.bar)
  end
end
