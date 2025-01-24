## Firebase CLI
[official documentation](https://firebase.flutter.dev/docs/cli/)

run this command command to integrate firebase cli


- dart pub global activate firebase_cli 13.8.3
- firebase login
- firebase init


dev
flutterfire configure --project=test-project --out lib/firebase_options_dev.dart --ios-bundle-id=com.developersoptions.skeleton.dev --android-package-name=com.developersoptions.skeleton.dev
  
  prod
flutterfire configure --project=test-project --out lib/firebase_options_prod.dart --ios-bundle-id=com.developersoptions.skeleton --android-package-name=com.developersoptions.skeleton
