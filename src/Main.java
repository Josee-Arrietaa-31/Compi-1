import java.io.*;
import java_cup.runtime.Symbol;

/**
 * Clase principal para el Analizador Léxico
 * Lee un archivo fuente, genera tokens y escribe los resultados
 */
public class Main {
    
    public static void main(String[] args) {
        if (args.length < 1) {
            System.err.println("Uso: java Main <archivo_fuente> [archivo_salida]");
            System.err.println("Ejemplo: java Main input/programa.txt output/tokens.txt");
            System.exit(1);
        }
        
        String inputFile = args[0];
        String outputFile = args.length > 1 ? args[1] : "output/tokens.txt";
        
        try {
            // Crear el scanner con el archivo de entrada
            FileReader reader = new FileReader(inputFile);
            Scanner scanner = new Scanner(reader);
            
            // Crear el archivo de salida
            File outputDir = new File(new File(outputFile).getParent());
            if (!outputDir.exists()) {
                outputDir.mkdirs();
            }
            
            PrintWriter writer = new PrintWriter(new FileWriter(outputFile));
            
            // Escribir encabezado
            writer.println("=".repeat(80));
            writer.println("ANÁLISIS LÉXICO - TOKENS ENCONTRADOS");
            writer.println("Archivo: " + inputFile);
            writer.println("=".repeat(80));
            writer.printf("%-20s %-30s %-10s %-10s%n", "TIPO", "LEXEMA", "LÍNEA", "COLUMNA");
            writer.println("-".repeat(80));
            
            // Contador de tokens
            int tokenCount = 0;
            int errorCount = 0;
            
            // Leer y procesar tokens
            Symbol token;
            while ((token = scanner.next_token()).sym != sym.EOF) {
                tokenCount++;
                String tokenType = getTokenName(token.sym);
                String lexeme = token.value != null ? token.value.toString() : "";
                int line = token.left;
                int column = token.right;
                
                writer.printf("%-20s %-30s %-10d %-10d%n", 
                            tokenType, lexeme, line, column);
            }
            
            // Escribir estadísticas
            writer.println("-".repeat(80));
            writer.println("Total de tokens encontrados: " + tokenCount);
            writer.println("=".repeat(80));
            
            // Cerrar archivos
            writer.close();
            reader.close();
            
            System.out.println("Análisis léxico completado exitosamente.");
            System.out.println("Archivo de entrada: " + inputFile);
            System.out.println("Archivo de salida: " + outputFile);
            System.out.println("Tokens procesados: " + tokenCount);
            
        } catch (FileNotFoundException e) {
            System.err.println("Error: No se encontró el archivo '" + inputFile + "'");
            System.exit(1);
        } catch (IOException e) {
            System.err.println("Error de E/S: " + e.getMessage());
            System.exit(1);
        } catch (Exception e) {
            System.err.println("Error durante el análisis: " + e.getMessage());
            e.printStackTrace();
            System.exit(1);
        }
    }
    
    /**
     * Obtiene el nombre legible del tipo de token
     */
    private static String getTokenName(int tokenType) {
        switch (tokenType) {
            // Tipos de datos
            case sym.INT: return "INT";
            case sym.FLOAT: return "FLOAT";
            case sym.BOOL: return "BOOL";
            case sym.CHAR: return "CHAR";
            case sym.STRING: return "STRING";
            case sym.COAL: return "COAL";
            
            // Variables y funciones
            case sym.WORLD: return "WORLD";
            case sym.LOCAL: return "LOCAL";
            case sym.GIFT: return "GIFT";
            
            // Estructuras de control
            case sym.DECIDE: return "DECIDE";
            case sym.OF: return "OF";
            case sym.END: return "END";
            case sym.ELSE: return "ELSE";
            case sym.LOOP: return "LOOP";
            case sym.EXIT: return "EXIT";
            case sym.WHEN: return "WHEN";
            case sym.FOR: return "FOR";
            case sym.BREAK: return "BREAK";
            case sym.RETURN: return "RETURN";
            
            // Método principal
            case sym.NAVIDAD: return "NAVIDAD";
            
            // Entrada/Salida
            case sym.SHOW: return "SHOW";
            case sym.GET: return "GET";
            
            // Valores booleanos
            case sym.TRUE: return "TRUE";
            case sym.FALSE: return "FALSE";
            
            // Operadores relacionales y lógicos
            case sym.EQ: return "EQ";
            case sym.NEQ: return "NEQ";
            case sym.LT: return "LT";
            case sym.GT: return "GT";
            case sym.LEQ: return "LEQ";
            case sym.GEQ: return "GEQ";
            case sym.AND: return "AND";
            case sym.OR: return "OR";
            case sym.NOT: return "NOT";
            
            // Operadores aritméticos
            case sym.PLUS: return "PLUS";
            case sym.MINUS: return "MINUS";
            case sym.TIMES: return "TIMES";
            case sym.DIV: return "DIV";
            case sym.DIV_INT: return "DIV_INT";
            case sym.MOD: return "MOD";
            case sym.POW: return "POW";
            case sym.INCREMENT: return "INCREMENT";
            case sym.DECREMENT: return "DECREMENT";
            case sym.ASSIGN: return "ASSIGN";
            
            // Delimitadores
            case sym.LPAREN: return "LPAREN";
            case sym.RPAREN: return "RPAREN";
            case sym.LBRACE: return "LBRACE";
            case sym.RBRACE: return "RBRACE";
            case sym.LBRACKET: return "LBRACKET";
            case sym.RBRACKET: return "RBRACKET";
            case sym.ENDL: return "ENDL";
            case sym.COMMA: return "COMMA";
            case sym.ARROW: return "ARROW";
            
            // Literales
            case sym.INT_LITERAL: return "INT_LITERAL";
            case sym.FLOAT_LITERAL: return "FLOAT_LITERAL";
            case sym.HEX_LITERAL: return "HEX_LITERAL";
            case sym.BINARY_LITERAL: return "BINARY_LITERAL";
            case sym.STRING_LITERAL: return "STRING_LITERAL";
            case sym.CHAR_LITERAL: return "CHAR_LITERAL";
            
            // Identificador
            case sym.ID: return "ID";
            
            default: return "UNKNOWN";
        }
    }
}
