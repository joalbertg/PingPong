class LeaderboardSerializer < ActiveModel::Serializer
  attributes :id, :rank, :first_name, :last_name, :email
end
