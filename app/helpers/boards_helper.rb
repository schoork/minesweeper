module BoardsHelper
  def bombs_near(set, x, y)
    near_array = []
    (x - 1..x + 1).each do |i|
      (y - 1..y + 1).each do |j|
        near_array << [i, j]
      end
    end
    count = set.intersection(near_array).count
    count.positive? ? count : ""
  end

  def bombs_near_color(set, x, y)
    case bombs_near(set, x, y)
    when 1
      "text-blue-700"
    when 2
      "text-green-700"
    when 3
      "text-red-700"
    when 4
      "text-indigo-900"
    when 5
      "text-orange-800"
    when 6
      "text-teal-600"
    when 7
      "text-black"
    when 8
      "text-gray-500"
    else
      ""
    end
  end

  def nicely_formatted_datetime(datetime)
    datetime.strftime("%-m/%-d/%y at %H:%M%P %Z")
  end

  def game_status_color(board)
    board.game_over? ? "text-red-500" : "text-blue-500"
  end
end
