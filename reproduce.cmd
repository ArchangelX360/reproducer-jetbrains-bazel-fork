move C:\ProgramData\reproducer\out C:\ProgramData\reproducer\out_bak
bazelisk.exe clean --expunge
bazelisk.exe build //:consumer
bazelisk.exe clean
bazelisk.exe build //:consumer
