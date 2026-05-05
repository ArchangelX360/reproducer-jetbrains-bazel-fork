import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Consumer {
    public static void main(String[] args) throws IOException {
        Path outFile = Path.of(args[0]);
        Path file1 = Paths.get(args[1]);
        Path file2 = Paths.get(args[2]);

        Files.createDirectories(outFile.getParent());

        String text1 = Files.readString(file1);
        String text2 = Files.readString(file2);

        if (Files.exists(outFile)) {
            Files.delete(outFile);
        }
        Files.createFile(outFile);
        Files.writeString(outFile, text1 + text2);
    }
}