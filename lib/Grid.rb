
class Grid

    def initialize()
        @grid = Array.new() 
        7.times { @grid.push Array.new().fill(:empty,0,6)}
        @max = Array.new.fill(0,0,6)
    end

    def cell(col,row)
        @grid[col][row]
    end

    def add(column,color) 
        return if @max[column] == 6
        @grid[column][@max[column]] = color
        @max[column]+=1
    end

    def to_s
        result = ""
        for row in 0..5 do
            result +="\n"
            for col in 0..6 do
                c = " "
                case cell(col,5-row) 
                when :empty 
                    c = '.' 
                when :yellow 
                    c = 'o'
                when :red 
                    c = '*'
                end
                result += c
            end
        end
        result+"\n"
    end

    def from_s(s)
        row = 6
        col = 0
        s.each_char do | c |
            case c 
            when 'o' 
                @grid[col][row] = :yellow
            when '*'
                @grid[col][row] = :red
            when '.' 
                @grid[col][row] = :empty
            when "\n"
                row -= 1
                col = -1
            end
            col += 1
        end
    end
end
