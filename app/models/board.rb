class Board < ApplicationRecord
  belongs_to :user
  has_many :board_rows

  validates :height, :width, :mine_number, :name, presence: true
  validate :is_playable?

  before_create :generate_bombs

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

  def generate_bombs
    temp_bombs = Set.new

    while temp_bombs.length < mine_number
      temp_bombs.add([rand(width), rand(height)])
    end

    self.bombs = temp_bombs.to_a
  end
end
