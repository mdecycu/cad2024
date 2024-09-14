@echo off

REM 下載 python_2025_lite.7z

curl --user account:password --output C:\Users\%USERNAME%\Downloads\python_2025_lite.7z "http://229.cycu.org/python_2025_lite.7z"

REM 解開壓縮檔案至 C:\

"C:\Program Files\7-Zip\7z" x C:\Users\%USERNAME%\Downloads\python_2025_lite.7z -oC:\ -y