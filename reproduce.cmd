bazelisk.exe clean --expunge
if exist "C:\ProgramData\reproducer\out" exit 1
bazelisk.exe build //:consumer --disk_cache=C:/ProgramData/reproducer/out/dc
bazelisk.exe clean
bazelisk.exe build //:consumer --disk_cache=C:/ProgramData/reproducer/out/dc
