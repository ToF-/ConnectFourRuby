class Referee
    attr_reader :player

    def initialize(grid)
        @grid = grid
        @player = :yellow
    end

    def accept(column)
        @grid.add(column,@player)
        @player = @player == :yellow ? :red : :yellow
    end
end
