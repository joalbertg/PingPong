class RankingsMailer < ApplicationMailer
  def send_rankings(user, list)
    @leader = list
    mail(to: user.email, subject: 'Rankings')
  end
end
