# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/ranking'

class TcMain < MiniTest::Test
  def test_main
    dir = File.expand_path('..', __dir__)
    out = File.open("#{dir}/testdata/ranking/out/success.csv")

    args = ['testdata/ranking/in/game_ently_log.csv', 'testdata/ranking/in/game_score_log.csv']
    assert_output(out.read) { main(args) }
  end

  def test_main_none
    dir = File.expand_path('..', __dir__)
    out = File.open("#{dir}/testdata/ranking/out/none.csv")

    args = ['testdata/ranking/in/game_ently_log_none.csv', 'testdata/ranking/in/game_score_log_none.csv']
    assert_output(out.read) { main(args) }

  end
end
