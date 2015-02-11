require 'rspec'
require 'Grid'


describe Grid do
    it "should be empty when init" do 
        grid = Grid.new
        expect(grid.cell(0,0)).to be :empty
        expect(grid.cell(6,5)).to be :empty
    end

    it "should stack tokens when added" do
        grid = Grid.new
        grid.add(0,:red)
        grid.add(0,:yellow)
        expect(grid.cell(0,0)).to be :red
        expect(grid.cell(0,1)).to be :yellow
    end 

    it "should stop stacking tokens after 6 tokens" do
        grid = Grid.new
        6.times { grid.add(0,:red) }
        grid.add(0,:yellow)
        expect(grid.cell(0,5)).to be :red
    end

    it "should render itself as a string" do
        grid = Grid.new
        grid.add(0,:yellow)
        grid.add(1,:red)
        expect(grid.to_s).to eq """
.......
.......
.......
.......
.......
o*.....
"""
    end
    it "should be set with a text string" do
        grid = Grid.new()
        grid.from_s("""
......o
.....**
.....*o
.....oo
o....*o
*....o*
""")
        expect(grid.cell(0,0)).to be :red
    end
end
