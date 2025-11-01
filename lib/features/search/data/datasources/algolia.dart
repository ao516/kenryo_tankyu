import 'package:algoliasearch/algoliasearch.dart';
import 'package:kenryo_tankyu/core/constants/const.dart';

class Application {
  static final algolia = SearchClient(
    apiKey: 'af59b094acf280d15b8af0dfbe3f84a8',
    appId: 'U8QVZX9D5F',
    options: ClientOptions(
      headers: {'X-Algolia-User-Agent': 'KenryoTankyuApp/${version}'},
    ),
  );
}
