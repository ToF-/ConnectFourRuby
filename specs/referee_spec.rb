require 'rspec'
require 'Referee'

describe Referee do
    before(:each) do
        @grid = Grid.new
        @referee = Referee.new(@grid)
    end
    it "should know whose turn it is to play at init" do
       expect(@referee.player).to be :yellow
    end

    it "should know whose turn it is to play after a move" do
       @referee.accept(1)
       expect(@referee.player).to be :red
       @referee.accept(1)
       expect(@referee.player).to be :yellow
    end

    it "should add a token in the grid for the player" do
       @referee.accept(1)
       expect(@grid.cell(1,0)).to be :yellow
    end
end
