# reproducer-jetbrains-bazel-fork

## Steps to reproduce

1. Remove `C:\ProgramData\reproducer\out` if it exists.
2. Run `reproducer.cmd`, it should fail.
3. Try to change version to upstream Bazel `8.5.1` and run `reproducer.cmd` again, it should work.
