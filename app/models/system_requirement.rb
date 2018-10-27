class SystemRequirement < ApplicationRecord
  belongs_to :game
  belongs_to :processor
  belongs_to :graphic
  belongs_to :memory
end
