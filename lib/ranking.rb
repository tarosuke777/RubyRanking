# frozen_string_literal: true

def ranking
  dir = File.expand_path('..', __dir__)
  entry_log = File.read("#{dir}/testdata/ranking/in/game_ently_log.csv")
  puts entry_log
end
