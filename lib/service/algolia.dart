import 'package:algolia/algolia.dart';

class Application{
  static const Algolia algolia = Algolia.init(
    applicationId: 'U8QVZX9D5F',
    apiKey: 'af59b094acf280d15b8af0dfbe3f84a8', //TODO これはadminキーなので、本番では変更する
  );
}