module BoardsHelper
  def bombs_near(set, x, y)
    near_array = []
    (x-1..x+1).each do |i|
      (y-1..y+1).each do |j|
        near_array << [i, j]
      end
    end
    set.intersection(near_array).count
  end
end
