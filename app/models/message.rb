class Message < ApplicationRecord
  belongs_to :gamer
  validates :content, presence: true
  validates :gamer_id, presence: true
  def self.most_recent
    order(:created_at).last(20)
  end
end