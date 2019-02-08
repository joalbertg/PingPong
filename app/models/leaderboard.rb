class Leaderboard < ActiveModelSerializers::Model
  # -- AR Extensions --------------------------------------------------------

  include ActiveModel::Validations

  # -- Attributes -----------------------------------------------------------

  attr_accessor :id, :rank, :first_name, :last_name, :email

  # -- Validations ----------------------------------------------------------

  validates :id, presence: true
  validates :rank, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
