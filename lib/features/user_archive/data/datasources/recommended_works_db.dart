
import 'dart:convert';
import 'package:kenryo_tankyu/features/research_work/domain/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';


//Searchedのモデルを変えたりすると、エラーになる可能性があるので注意。
class RecommendedWork {
  static Future<void> save(Searched searched1, Searched searched2) async {
    final prefs = await SharedPreferences.getInstance();
    //この形は、SQLiteの時に保存されるJson形式と同じにしている。なぜなら保存したタイミングが記録されるようになっているため。

    final json1 = jsonEncode(searched1.toSQLite());
    final json2 = jsonEncode(searched2.toSQLite());

    //SharedPreferencesにstringとして保存
    prefs.setString('searched1', json1);
    prefs.setString('searched2', json2);
  }

  static Future<List<Searched>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final json1 = prefs.getString('searched1');
    final json2 = prefs.getString('searched2');
    if (json1 == null || json2 == null) {
      return [];
    }
    final searched1 = Searched.fromSQLite(jsonDecode(json1));
    final searched2 = Searched.fromSQLite(jsonDecode(json2));

    return [searched1, searched2];
  }
}