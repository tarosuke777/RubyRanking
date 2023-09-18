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

  prev_score = 0
  rank = 0
  out_rank = 0
  ranking_data = []

  player_id_to_score_sorted.each do |key, value|
    player_id = key
    handle_name = player_id_to_score[player_id]
    score = value

    next if handle_name == ''

    rank += 1

    out_rank = rank if score != prev_score

    break if out_rank > 10

    ranking_data.push("#{out_rank},#{player_id},#{handle_name},#{score}")
    prev_score = score
  end

  ranking_data.each do |value|
    p value
  end
end

ranking
