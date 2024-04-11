import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kenryo_tankyu/providers/providers.dart';

class FireStoreService {
  //シングルトンの作成。instanceでインスタンスを作成。
  static final FireStoreService _instance = FireStoreService._();
  FireStoreService._();
  static FireStoreService get instance => _instance;

  Future saveFavoriteData(
      {required int nowFavoriteValue,
        required Searched searched,
      required int isFavorite,
      required bool needToChangeAlgoliaValue}) async {

    //TODO 結構ぐっちゃぐちゃなので後で直そう
    final int nextFavoriteValue =
    isFavorite == 1 ? nowFavoriteValue - 1 : nowFavoriteValue + 1;

    //algoliaの変更を計
    int nextAlgoliaFavoriteValue = 0;
    if (nextFavoriteValue <= 5 || nextFavoriteValue % 5 == 0) {
      nextAlgoliaFavoriteValue = nextFavoriteValue;
    }

    final firestore =
        FirebaseFirestore.instance.collection('works').doc(searched.documentID);

    if (nextAlgoliaFavoriteValue != -10 && needToChangeAlgoliaValue) {
      debugPrint('【Algoliaも同時に変更を加えます】\n現在のisFavoriteState = $isFavorite\n$nowFavoriteValueから$nextFavoriteValueに変更。\nAlgoliaは$nextAlgoliaFavoriteValueにします。');
      await firestore.update({
        'exactLikes': nextFavoriteValue,
        'vagueLikes': nextAlgoliaFavoriteValue
      });
    } else {
      debugPrint('【Firestoreのみ変更を加えます】\n現在のisFavoriteState = $isFavorite\n$nowFavoriteValueから$nextFavoriteValueに変更。');
      await firestore.update({'exactLikes': nextFavoriteValue});
    }
  }

  Future<void> create() async {
    final db = FirebaseFirestore.instance;
    await db.collection('works').doc('00320215').set({
      'title': 'コミュニケーション×SNS 〜僕たちは原始人に戻るべきか?〜',
      'category1': 'テクノロジー・工学',
      'subCategory1': 'スマートフォン',
      'category2': '地域・社会',
      'subCategory2': 'コミュニケーション',
      'year': 2020,
      'eventName': '個人探究',
      'course': '探究科',
      'existsSlide': true,
      'existsReport': true,
      'existsThesis': true,
      'existsPoster': true,
      'author': '後藤碧生',
      'vagueLikes': 0,
      'exactLikes': 0,
    });
    await db.collection('works').doc('00320224').set({
      'title': 'みんなのぶしつ 〜高校生の放課後の居場所に挑む〜',
      'category1': '地域・社会',
      'subCategory1': 'コミュニティ',
      'category2': 'くらし',
      'subCategory2': '学校生活',
      'year': 2020,
      'eventName': '個人探究',
      'course': '探究科',
      'existsSlide': false,
      'existsReport': true,
      'existsThesis': true,
      'existsPoster': false,
      'author': '田口壱星',
      'vagueLikes': 0,
      'exactLikes': 0,
    });
    await db.collection('works').doc('00220101').set({
      'title': '「ブラック」な教育現場をITの力で働き方改革',
      'category1': 'スポーツ・教育',
      'subCategory1': '教育',
      'category2': 'テクノロジー・工学',
      'subCategory2': 'IT',
      'year': 2019,
      'eventName': '個人探究',
      'course': '探究科',
      'existsSlide': false,
      'existsReport': true,
      'existsThesis': false,
      'existsPoster': true,
      'author': '青木陸哉',
      'vagueLikes': 0,
      'exactLikes': 0,
    });
    await db.collection('works').doc('00220236').set({
      'title': 'iPad、効率的に使ってますか?~縣陵生の学力を向上させるアプリの開発~',
      'category1': 'スポーツ・教育',
      'subCategory1': '教育',
      'category2': 'テクノロジー・工学',
      'subCategory2': 'IT',
      'year': 2019,
      'eventName': '個人探究',
      'course': '探究科',
      'existsSlide': false,
      'existsReport': true,
      'existsThesis': false,
      'existsPoster': true,
      'author': '務䑓結月',
      'vagueLikes': 0,
      'exactLikes': 0,
    });
    await db.collection('works').doc('00220505').set({
      'title': '朝、スッキリ起きられるためには',
      'category1': '健康・医療',
      'subCategory1': '睡眠',
      'category2': 'テクノロジー・工学',
      'subCategory2': 'スマートフォン',
      'year': 2019,
      'eventName': '個人探究',
      'course': '普通科',
      'existsSlide': false,
      'existsReport': true,
      'existsThesis': false,
      'existsPoster': true,
      'author': '飯田菜央',
      'vagueLikes': 0,
      'exactLikes': 0,
    });
    await db.collection('works').doc('00320324').set({
      'title': '黒板とホワイトボードどちらが勉強に最適か',
      'category1': 'スポーツ・教育',
      'subCategory1': '勉強',
      'category2': '科学・数学',
      'subCategory2': '化学',
      'year': 2020,
      'eventName': '個人探究',
      'course': '普通科',
      'existsSlide': false,
      'existsReport': true,
      'existsThesis': false,
      'existsPoster': true,
      'author': '高木美羽',
      'vagueLikes': 0,
      'exactLikes': 0,
    });
    await db.collection('works').doc('00420103').set({
      'title': '人生最大䛾悩み“猫背”ここで治さずいつ治す!?',
      'category1': '健康・医療',
      'subCategory1': 'からだ',
      'category2': 'スポーツ・教育',
      'subCategory2': 'トレーニング',
      'year': 2021,
      'course': '探究科',
      'eventName': '個人探究',
      'existsSlide': false,
      'existsReport': true,
      'existsThesis': false,
      'existsPoster': true,
      'author': '荒﨑優芽',
      'vagueLikes': 0,
      'exactLikes': 0,
    });
    await db.collection('works').doc('00420127').set({
      'title': '交流のできる駄菓子屋を作ろう',
      'category1': 'ビジネス・経済',
      'subCategory1': '店',
      'category2': '地域・社会',
      'subCategory2': 'コミュニティ',
      'year': 2021,
      'eventName': '個人探究',
      'course': '探究科',
      'existsSlide': false,
      'existsReport': true,
      'existsThesis': false,
      'existsPoster': true,
      'author': '橋本あかり',
      'vagueLikes': 0,
      'exactLikes': 0,
    });
    await db.collection('works').doc('00511001').set({
      'title': 'ニジマスのこれから 〜外来種=観光資源?〜',
      'category1': '一次産業',
      'subCategory1': '魚',
      'category2': '自然環境',
      'subCategory2': '外来生物',
      'year': 2022,
      'eventName': '信州学',
      'course': '探究科',
      'existsSlide': false,
      'existsReport': true,
      'existsThesis': false,
      'existsPoster': true,
      'author': '橋本昂賢、中畑慧琉',
      'vagueLikes': 0,
      'exactLikes': 0,
    });
    await db.collection('works').doc('00411001').set({
      'title': 'お腹の音の悩みを解決しよう！',
      'category1': '健康・医療',
      'subCategory1': 'からだ',
      'category2': 'スポーツ・教育',
      'subCategory2': '勉強',
      'year': 2021,
      'eventName': '信州学',
      'course': '共同',
      'existsSlide': false,
      'existsReport': true,
      'existsThesis': false,
      'existsPoster': true,
      'author': '小東聖美、澤木文菜、関谷ひより',
      'vagueLikes': 0,
      'exactLikes': 0,
    });
  }
}
