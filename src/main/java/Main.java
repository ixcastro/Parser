import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Main {

    private static String filePath = "integral.c";
    private static String lexerPath = "src/main/jflex/tokenCup.jflex";
    private static String parserPath = "src/main/jcup/parser.cup";
    private static String[] sintaxPath = {"-parser", "Sintax", parserPath, };

    public static void main(String[] args) throws IOException {
        // TokenTable tokenTable = new TokenTable();

        // tokenTable.scanFile(filePath);
        // tokenTable.printTokenTable();
        // tokenTable.printErrorTable();
        generateFile(lexerPath, parserPath, sintaxPath);
    }

    public static void generateFile(String lexerPath, String parserPath, String[] sintaxPath) throws IOException {
        File fileLexer = new File(lexerPath);
        JFlex.Main.generate(fileLexer);
        File fileParser = new File(parserPath);
        JFlex.Main.generate(fileParser);
        java_cup.Main.main(sintaxPath);

        Path symPath = Paths.get("src/main/jcup/sym.java");
        if(Files.exists(symPath)){
            Files.delete(symPath);
        }
        Path sinPath = Paths.get("src/main/jcup/Sintax.java");
        if(Files.exists(sinPath)){
            Files.delete(sinPath);
        }


        Files.move(Paths.get("sym.java"), Paths.get("src/main/jcup/sym.java"));
        Files.move(Paths.get("Sintax.java"), Paths.get("src/main/jcup/Sintax.java"));
    }
}
