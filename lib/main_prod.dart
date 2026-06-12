import 'package:pocky/bootstrap.dart';
import 'package:pocky/config/app_config.dart';

Future<void> main() {
  return bootstrap(AppConfig.production());
}
