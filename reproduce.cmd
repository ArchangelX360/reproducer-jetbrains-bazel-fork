if exist "C:\ProgramData\reproducer\out" bazelisk.exe shutdown && exit 1
bazelisk.exe clean --expunge
bazelisk.exe build //:consumer --disk_cache=C:/ProgramData/reproducer/out/dc
bazelisk.exe clean
bazelisk.exe build //:consumer --disk_cache=C:/ProgramData/reproducer/out/dc
