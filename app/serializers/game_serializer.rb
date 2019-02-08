class GameSerializer < ActiveModel::Serializer
  attributes :id, :player_id, :player_score, :opponent_id, :opponent_score, :played_at
end
