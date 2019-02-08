class SendRankingsJob < ApplicationJob
  queue_as :email_rankings

  def perform(user_id, list)
    user = User.find_by_id(user_id)
    RankingsMailer.send_rankings(user, list).deliver_later unless user.nil?
  end
end
