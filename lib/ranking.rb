# frozen_string_literal: true

require 'csv'

def ranking
  dir = File.expand_path('..', __dir__)

  player_id_to_name = {}
  CSV.foreach("#{dir}/testdata/ranking/in/game_ently_log.csv", headers: true) do |row|
    player_id_to_name.store(row['player_id'], row['handle_name'])
  end

  player_id_to_score = {}
  CSV.foreach("#{dir}/testdata/ranking/in/game_score_log.csv", headers: true) do |row|
    if player_id_to_score.key(row['player_id'])
      score = player_id_to_score.fetch(row['player_id'])
      player_id_to_score.store(row['player_id'], row['score']) if score < row['score'].to_i
    else
      player_id_to_score.store(row['player_id'], row['score'].to_i)
    end
  end

  player_id_to_score_sorted = player_id_to_score.sort_by { |_, v| -v }.to_h
  p player_id_to_score_sorted
end

ranking
