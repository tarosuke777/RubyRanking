# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/ranking'

class TcMain < MiniTest::Test
  def test_ranking
    dir = File.expand_path('..', __dir__)
    out = File.open("#{dir}/testdata/ranking/out/success.csv")
    assert_output(out.read) { ranking }
  end
end
