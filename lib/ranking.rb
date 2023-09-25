# frozen_string_literal: true

require 'csv'

def get_player_id_to_name(entry_log_file)
  player_id_to_name = {}
  CSV.foreach(entry_log_file, headers: true) do |row|
    player_id_to_name.store(row['player_id'], row['handle_name'])
  end
  player_id_to_name
end

def get_player_id_to_score(score_log_file)
  player_id_to_score = {}
  CSV.foreach(score_log_file, headers: true) do |row|
    score = player_id_to_score.fetch(row['player_id']) if player_id_to_score.key(row['player_id'])
    player_id_to_score.store(row['player_id'], row['score'].to_i) if score.nil? || score < row['score'].to_i
  end
  player_id_to_score
end

def get_ranking_data(player_id_to_name, player_id_to_score_sorted)
  prev_score = 0
  rank = 0
  out_rank = 0
  ranking_data = []
  player_id_to_score_sorted.each do |player_id, score|
    next if player_id_to_name[player_id] == ''

    rank += 1
    out_rank = rank if score != prev_score
    break if out_rank > 10

    ranking_data.push("#{out_rank},#{player_id},#{player_id_to_name[player_id]},#{score}")
    prev_score = score
  end
  ranking_data
end

def out_ranking(ranking_data)
  puts 'rank,player_id,handle_name,score'
  ranking_data.each { |value| puts value }
end

def validate(entry_log_file_path, score_log_file_path)
  raise 'entry_log_file_path not exists' unless FileTest.exist?(entry_log_file_path)
  raise 'score_log_file_path not exists' unless FileTest.exist?(score_log_file_path)
end

def main(args)
  dir = File.expand_path('..', __dir__)
  entry_log_file_path =  "#{dir}/#{args[0]}"
  score_log_file_path =  "#{dir}/#{args[1]}"

  validate(entry_log_file_path, score_log_file_path)

  player_id_to_name = get_player_id_to_name(entry_log_file_path)
  player_id_to_score = get_player_id_to_score(score_log_file_path)
  player_id_to_score_sorted = player_id_to_score.sort_by { |_, v| -v }.to_h
  ranking_data = get_ranking_data(player_id_to_name, player_id_to_score_sorted)
  out_ranking(ranking_data)
end
