class Board < ApplicationRecord
  validates :email, :name, presence: true
  validates :email, email: true, unless: -> { email.blank? }
  validates :width, :height, :mine_number, numericality: {only_integer: true, greater_than: 0}
  validate :is_playable?

  before_create :generate_bombs

  scope :ordered, -> { order(created_at: :desc) }
  scope :limit_ordered, -> { ordered.limit(10) }

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

  def add_click(x, y, flag)
    if flag
      if flags.include?([x, y])
        flags.delete([x, y])
      else
        flags << [x, y]
      end
    elsif bombs.include?([x, y])
      self.game_over = true
    else
      clicks << [x, y]
      flags.delete([x, y])
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
