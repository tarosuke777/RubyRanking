# frozen_string_literal: true

require 'csv'

def ranking
  dir = File.expand_path('..', __dir__)

  entry_id_to_name = {}
  CSV.foreach("#{dir}/testdata/ranking/in/game_ently_log.csv", headers: true) do |row|
    entry_id_to_name.store(row['player_id'], row['handle_name'])
  end

  puts entry_id_to_name
  score_log = File.read("#{dir}/testdata/ranking/in/game_score_log.csv")
end

ranking
