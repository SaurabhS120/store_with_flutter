@echo off
REM Run flutter pub get presentation
echo presentation pub get
call flutter clean
call flutter pub get

REM Run flutter pub get Domain
echo domain pub get
cd domain
call flutter clean
call flutter pub get

REM Run flutter pub get Data
echo data pub get
cd ../data
call flutter clean
call flutter pub get

echo executing build runner parallelly

REM Build runner in Presentation
echo presentation build runner
cd ..
start cmd /c "echo Presentation layer build && dart run build_runner build --delete-conflicting-outputs"

REM Build runner in Domain
echo domain build runner
cd domain
start cmd /c "echo Domain layer build && dart run build_runner build --delete-conflicting-outputs"

REM Build runner in Data
echo data build runner
cd ../data
start cmd /c "echo Data layer build && dart run build_runner build --delete-conflicting-outputs"