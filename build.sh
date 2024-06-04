
flutter clean
flutter pub get

cd domain || exit
flutter clean
flutter pub get

cd ../data || exit
flutter clean
flutter pub get

cd ..
dart run build_runner build --delete-conflicting-outputs &

cd domain || exit
dart run build_runner build --delete-conflicting-outputs &

cd ../data || exit
dart run build_runner build --delete-conflicting-outputs &
