class Board < ApplicationRecord
  belongs_to :user

  validates :height, :width, :mine_number, :name, presence: true
  validate :is_playable?

  def difficulty
    return "Unknown" unless height && width && mine_number

    if density < 15
      "Easy"
    elsif density < 20
      "Intermediate"
    else
      "Hard"
    end
  end

  def dimensions
    "#{width} x #{height}"
  end

  def density
    (mine_number.to_f / (height * width) * 100).round(1)
  end

  def is_playable?
    return unless height && width && mine_number

    if density > 50
      errors.add(:mine_number, "is too large")
    end
  end
end
