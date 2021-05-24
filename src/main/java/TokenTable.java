import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Hashtable;
import java.io.BufferedReader;
import java.io.FileReader;

public class TokenTable {
    private Hashtable<String, Token> tokenList = new Hashtable<>();
    private Hashtable<String, ArrayList<Position>> errorList = new Hashtable<>();
    public TokenTable() { }

    public void scanFile(String filePath) {
        try {
            BufferedReader buffer = new BufferedReader(new FileReader(filePath));
            LexScanner scanner = new LexScanner(buffer);
            Token token = scanner.yylex();

            while (token != null) {
                if (token.getToken()!="ERROR") {
                    if (this.tokenList.get(token.getLexeme()) == null) {
                        this.tokenList.put(token.getLexeme(), token);
                    } else {
                        int line = (int) token.occurrencies.keySet().toArray()[0];
                        tokenList.get(token.getLexeme()).insertOccurrenceLine(line);
                    }
                } else {
                    if (this.errorList.get(token.getLexeme()) == null) {
                        int line = (int) token.occurrencies.keySet().toArray()[0];
                        int column = (int) token.occurrencies.get(line);
                        this.errorList.put(token.getLexeme(), new ArrayList<>());
                        this.errorList.get(token.getLexeme()).add(new Position(line, column));
                    } else {
                        int line = (int) token.occurrencies.keySet().toArray()[0];
                        int column = (int) token.occurrencies.get(line);
                        this.errorList.get(token.getLexeme()).add(new Position(line, column));
                    }
                }
                token = scanner.yylex();
            }
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
        }
    }

    public void printTokenTable() {
        System.out.println("╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗");
        System.out.println("║                                                                     TABLA DE TOKENS                                                                              ║");
        System.out.println("╠════════════════════════════════════════╦════════════════════════════════════════╦════════════════════════════════════════════════════════════════════════════════╣");
        System.out.println("║ Lexema                                 ║ Token                                  ║ Linea (Apariciones)                                                            ║");

        for (String key : this.tokenList.keySet()) {
            String lexeme = this.tokenList.get(key).getLexeme();
            lexeme += getNSpaces(38 - lexeme.length());
            String token = this.tokenList.get(key).getToken();
            token += getNSpaces(38 - token.length());
            String line = this.tokenList.get(key).getStringOccurrences();
            line += getNSpaces(78 - line.length());
            String str = "║ " + lexeme + " ║ " + token + " ║ " + line + " ║";
            System.out.println("╠════════════════════════════════════════╬════════════════════════════════════════╬════════════════════════════════════════════════════════════════════════════════╣");
            System.out.println(str);
        }
        System.out.println("╚════════════════════════════════════════╩════════════════════════════════════════╩════════════════════════════════════════════════════════════════════════════════╝");
    }

    public void printErrorTable() {
        System.out.println("╔════════════════════════════════════════════════════════════════════════════════════════════════╗");
        System.out.println("║                                         TABLA DE ERRORES                                       ║");
        System.out.println("╠══════════════════════════════╦═════════════════════════════════════════════════════════════════╣");
        System.out.println("║ Lexema                       ║ Linea (Columna)                                                 ║");
        for (String key : this.errorList.keySet()) {
            String lexeme = key;
            lexeme += getNSpaces(28 - lexeme.length());
            String positions = this.positionsToString(this.errorList.get(key));
            positions += getNSpaces(63 - positions.length());
            String str = "║ " + lexeme + " ║ " + positions + " ║";
            System.out.println("╠══════════════════════════════╬═════════════════════════════════════════════════════════════════╣");
            System.out.println(str);
        }
        System.out.println("╚══════════════════════════════╩═════════════════════════════════════════════════════════════════╝");
    }

    public String positionsToString(ArrayList<Position> positions) {
        String str = "";
        for (Position pos : positions) {
            str += pos.toString();
        }
        return str;
    }

    private String getNSpaces(int n) {
        String str = "";
        for (; n > 0; n--) {
            str += " ";
        }
        return str;
    }
}
