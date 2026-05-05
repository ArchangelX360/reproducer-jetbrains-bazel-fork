import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class CreateFile {
    public static void main(String[] args) throws IOException {
        if (args.length != 1) {
            System.err.println("Expected exactly one argument: output directory");
            System.exit(1);
        }

        Path outDir = Paths.get(args[0]);

        // Ensure directory exists
        Files.createDirectories(outDir);

        // Create file inside directory
        Path file = outDir.resolve("file.txt");
        Path nestedFile = outDir.resolve("META-INF").resolve("services").resolve("bar");
        Files.createDirectories(nestedFile.resolve(".."));
        Files.writeString(file, "Hello from Java\n");
        Files.writeString(nestedFile, "bar");

        System.out.println("Created: " + file);
        System.out.println("Created: " + nestedFile);

    }
}