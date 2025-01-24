 
import 'main_dev.dart' as dev;
// import 'main_prod.dart' as prod;

void main() async {
 
  dev.main();
  // prod.main();
  // sl<DioClient>().get('/users');
}

/*
to run this project you need to specify the flavor "dev" or "prod"
use flutter run --flavor dev for development or 
flutter run --flavor prod for production

dart run icons_launcher:create --path icons_launcher-dev.yaml
dart run icons_launcher:create --path icons_launcher-prod.yaml

*/
