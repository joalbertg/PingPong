class RecordService
  def initialize(game)
    @game = game
  end

  def create_object
    player_won = @game.player_score > @game.opponent_score ? @game.player : @game.opponent
    player_loser = @game.player_score > @game.opponent_score ? @game.opponent : @game.player

    Record.create(user: player_won, game: @game, won: 3) &&
      Record.create(user: player_loser, game: @game, lost: 1)
  end
end
