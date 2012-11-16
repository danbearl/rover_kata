require_relative 'kata'

describe Coordinate do

  let(:coord) { Coordinate.new(3,2) }

  it "has an x property" do
    coord.x.should == 3
  end

  it "has a y property" do
    coord.y.should == 2
  end

end

describe Grid do

  it "has rows" do
    Grid.new(rows: 4).rows.should == 4
  end

  it "has columns" do
    Grid.new(columns: 5).columns.should == 5
  end

  it "has a rover position" do
    coord = double 'coordinate'
    Grid.new(rover: coord).rover.should == coord
  end

  it "has a default rover position" do
    Grid.new.rover.x.should == 0
    Grid.new.rover.y.should == 0
  end

  it "has obstacles" do
    obstacles_collection = [double, double, double]
    Grid.new(obstacles: obstacles_collection).obstacles.should == obstacles_collection
  end

  describe "#draw" do
    it "includes the rover position in the grid" do
      pos = stub 'coordinate', x: 0, y: 0
      Grid.new(rows: 2, columns: 2, rover: pos).draw.should == <<GRID
| | |
|x| |
GRID
    end

    it "includes obstacles in the grid" do
      obs1 = stub 'obstacle', x: 1, y: 1
      obs2 = stub 'obstacle', x: 2, y: 2
      Grid.new(rows: 3, columns: 3, obstacles: [obs1, obs2]).draw.should == <<GRID
| | |o|
| |o| |
|x| | |
GRID
    end
  end

end
