bazelisk.exe shutdown
if exist "C:\ProgramData\reproducer\out" exit 1
bazelisk.exe clean --expunge
bazelisk.exe build //:consumer --disk_cache=C:/ProgramData/reproducer/out/dc
bazelisk.exe clean
bazelisk.exe build //:consumer --disk_cache=C:/ProgramData/reproducer/out/dc
