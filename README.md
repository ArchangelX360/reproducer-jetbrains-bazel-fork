# reproducer-jetbrains-bazel-fork

## Steps to reproduce

This should fail:
```shell
# On a Windows host
.\reproducer.cmd
```

Then changing to upstream Bazel `8.5.1` and re-running should work, proving an issue in the fork.
