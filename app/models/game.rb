class Game < ApplicationRecord
  # -- Constants ------------------------------------------------------------

  # -- Attributes -----------------------------------------------------------

  # -- AR Extensions --------------------------------------------------------

  # -- Relationships --------------------------------------------------------

  belongs_to :player, class_name: 'User'
  belongs_to :opponent, class_name: 'User'

  # -- Validations ----------------------------------------------------------

  validates :player, presence: true
  validates :opponent, presence: true
  validates :player_score, presence: true
  validates :opponent_score, presence: true
  validates :played_at, presence: true

  # -- Scopes ---------------------------------------------------------------

  scope :desc_order, -> { order(played_at: :desc) }

  # -- Callbacks ------------------------------------------------------------

  # -- Class Methods --------------------------------------------------------

  # -- Instance Methods -----------------------------------------------------
end
