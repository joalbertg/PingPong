class Record < ApplicationRecord
    # -- Constants ------------------------------------------------------------

  # -- Attributes -----------------------------------------------------------

  # -- AR Extensions --------------------------------------------------------

  # -- Relationships --------------------------------------------------------

  belongs_to :user, class_name: 'User'
  belongs_to :game, class_name: 'Game'

  # -- Validations ----------------------------------------------------------

  # -- Scopes ---------------------------------------------------------------

  scope :rankings, lambda {
    group(:user_id).select('user_id, SUM(won - lost) as score').order("score DESC")
  }
  # -- Callbacks ------------------------------------------------------------

  # -- Class Methods --------------------------------------------------------

  # -- Instance Methods -----------------------------------------------------
end
