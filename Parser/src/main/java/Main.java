
public class Main {

    private static String filePath = "integral.c";

    public static void main(String[] args) {
        TokenTable tokenTable = new TokenTable();
        tokenTable.scanFile(filePath);
        tokenTable.printTokenTable();
        tokenTable.printErrorTable();
    }
}
