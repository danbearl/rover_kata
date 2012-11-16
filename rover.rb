class Coordinate
  attr_reader :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

end

class Grid
  attr_reader :rows, :columns, :rover, :obstacles

  def initialize(args={})
    @rows      = args[:rows]
    @columns   = args[:columns]
    @rover     = args.fetch(:rover, Coordinate.new(0, 0))
    @obstacles = args[:obstacles]
  end

  def draw
    draw_string = ""
    x = rows - 1
    y = 0

    rows.times do
      columns.times do
        draw_string << "|#{tile(x,y)}"
        y += 1
        if y == columns
          y = 0
        end
      end
      draw_string << "|\n"
      x -= 1
    end

    draw_string
  end

  def tile(x,y)
    if rover?(x,y)
      "x"
    elsif obstacle?(x,y)
      "o"
    else
      " "
    end
  end

  def rover?(x,y)
    if x == rover.x && y == rover.y
      true
    end
  end

  def obstacle?(x,y)
    obstacles.any? {|obst| obst.x == x && obst.y == y} if obstacles
  end
end

grid = Grid.new(rows: 5,
                columns: 5,
                obstacles: [
                  Coordinate.new(1,1),
                  Coordinate.new(1,2),
                  Coordinate.new(4,3)
                ]
               )
print grid.draw
