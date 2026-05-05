rmdir /s /q C:\ProgramData\reproducer\out
bazelisk.exe build //:consumer
bazelisk.exe clean
bazelisk.exe build //:consumer
