import java.util.Hashtable;

public class Token {
    String token;
    String lexeme;
    Hashtable<Integer, Integer> occurrencies;

    //To insert a token
    Token(String token, String lexeme, int line) {
        this.token = token;
        this.lexeme = lexeme;
        this.occurrencies = new Hashtable<>();
        this.occurrencies.put(line + 1, 1);
    }

    //To insert an error
    Token(String token, String lexeme, int line, int column){
        this.token = token;
        this.lexeme = lexeme;
        this.occurrencies = new Hashtable<>();
        this.occurrencies.put(line + 1, column + 1);
    }

    public String getToken() {
        return this.token;
    }

    public String getLexeme() {
        return this.lexeme;
    }

    //Para insertar apariciones de cada token
    public void insertOccurrenceLine(int line) {
        if (this.occurrencies.get(line) == null){
            this.addNewOccurrence(line);
        } else {
            this.addOccurrenceInLine(line);
        }
    }

    //Nueva aparición en nueva línea de código
    public void addNewOccurrence(int line) {
        this.occurrencies.put(line, 1);
    }

    //Nueva aparición en la misma línea
    public void addOccurrenceInLine(int line) {
        int value = this.occurrencies.get(line);
        this.occurrencies.put(line, value + 1);
    }

    public String getStringOccurrences() {
        String str = "";
        for (int key : this.occurrencies.keySet()) {
            int value = this.occurrencies.get(key);
            if (value == 1 ){
                str += String.valueOf(key) + " ";
            } else {
                str += String.valueOf(key) + "(" + String.valueOf(value) + ") ";
            }
        }
        return str;
    }
}
