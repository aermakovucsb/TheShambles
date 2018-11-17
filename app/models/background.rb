class Background < ApplicationRecord
  belongs_to :game, optional: true
end
