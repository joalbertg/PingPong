# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |index|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456'
  )
  p "#{index + 1} user created"
end

opponents = [[1, 10], [2, 9], [3, 8], [4, 7], [5, 6], [1, 9], [2, 8], [3, 7], [4, 6], [5, 10]]
games_end = [[9, 21], [21, 19], [24, 22], [9, 21], [21, 19], [24, 22], [9, 21], [21, 19], [24, 22]]

opponents.each_with_index do |players, index|
  score = games_end.sample
  GameService.new(player_id: players.first,
                  opponent_id: players.second,
                  player_score: score.first,
                  opponent_score: score.second,
                  played_at: Time.now - index.days).create_object
  p "#{index + 1} record created"
end
