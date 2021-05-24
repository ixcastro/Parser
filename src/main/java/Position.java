public class Position {
    private int line;
    private int column;

    Position(int line, int column) {
        this.line = line;
        this.column = column;
    }

    public int getLine() {
        return line;
    }

    public int getColumn() {
        return column;
    }

    public String toString() {
        return String.valueOf(line) + "(" + String.valueOf(column) + ") ";
    }
}
