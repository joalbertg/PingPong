class GameService
  def initialize(params)
    @game = Game.new(params)
  end

  def create_object
    @game.transaction do
      if @game.save && RecordService.new(@game).create_object
        self.class.send_rankings
        return true
      end
    end
    false
  end

  def object
    @game
  end

  class << self
    def rankings
      rankings = Record.rankings
      @score_previous = 0
      @index_previous = 0

      rankings.map { |rank| build_object(rank) }
    end

    def send_rankings
      list = rankings
      list.map(&:id).each { |user_id| SendRankingsJob.perform_later(user_id, list.as_json) }
    end

    private

    def validate_rank(score)
      return @index_previous if @score_previous == score

      @index_previous += 1
    end

    def build_object(rank)
      obj = {
        id: rank.user_id,
        rank: validate_rank(rank.score),
        first_name: rank.user.first_name,
        last_name: rank.user.last_name,
        email: rank.user.email
      }
      @score_previous = rank.score
      Leaderboard.new(obj)
    end
  end
end
