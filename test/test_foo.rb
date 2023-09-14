# frozen_string_literal: true

require 'minitest/autorun'
require '../lib/ranking'

class TcMain < MiniTest::Test
  def test_ranking
    out = File.read('../testdata/ranking/out/success.csv')
    assert_output(out) { ranking }
  end
end
