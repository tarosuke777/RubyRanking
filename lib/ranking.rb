# frozen_string_literal: true

def ranking
  dir = File.expand_path('..', __dir__)
  entry_log = File.open("#{dir}/testdata/ranking/in/game_ently_log.csv")

  entry_id_to_name = {}
  entry_log.each_line do |line|
    values = line.split(',')
    entry_id_to_name.store(values[0], values[1])
  end

  puts entry_id_to_name
  score_log = File.read("#{dir}/testdata/ranking/in/game_score_log.csv")
end

ranking
