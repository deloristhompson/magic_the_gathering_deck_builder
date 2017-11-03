class CompleteCard < ApplicationRecord
  belongs_to :color
  belongs_to :type
  belongs_to :rarity
  belongs_to :card
end
