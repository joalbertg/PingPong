class GameShowSerializer < ActiveModel::Serializer
  attributes :id, :player_id, :opponent_id, :player_score, :opponent_score, :played_at
end
