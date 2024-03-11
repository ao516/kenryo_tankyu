import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final db = FirebaseFirestore.instance;

  Future<void> create() async {
    await db.collection('works').doc('00320215').set({
      'title': 'コミュニケーション×SNS 〜僕たちは原始人に戻るべきか?〜',
      'category1': 'テクノロジー・工学',
      'subCategory1': 'スマートフォン',
      'category2': '地域・社会',
      'subCategory2': 'コミュニケーション',
      'year': '2020',
      'course': '探究科',
      'report_url':null,
      'thesis_url':null,
      'slide_url':null,
      'poster_url':'https://docs.google.com/document/d/19nI7xrjB4NunYMLAn9FT-rKPT3Tf78RX1G6N5FDlV-A/edit?usp=sharing',
      'name':'後藤碧生',
      'likes': 0,
    });
    await db.collection('works').doc('00320224').set({
      'title': 'みんなのぶしつ 〜高校生の放課後の居場所に挑む〜',
      'category1': '地域・社会',
      'subCategory1': 'コミュニティ',
      'category2': 'くらし',
      'subCategory2': '学校生活',
      'year': '2020',
      'course': '探究科',
      'report_url':null,
      'thesis_url':null,
      'slide_url':null,
      'poster_url':'https://docs.google.com/document/d/19nI7xrjB4NunYMLAn9FT-rKPT3Tf78RX1G6N5FDlV-A/edit?usp=sharing',
      'name':'田口壱星',
      'likes': 0,
    });
    await db.collection('works').doc('00220101').set({
      'title': '「ブラック」な教育現場をITの力で働き方改革',
      'category1': 'スポーツ・教育',
      'subCategory1': '教育',
      'category2': 'テクノロジー・工学',
      'subCategory2': 'IT',
      'year': '2019',
      'course': '探究科',
      'report_url':null,
      'thesis_url':null,
      'slide_url':null,
      'poster_url':'https://docs.google.com/document/d/19nI7xrjB4NunYMLAn9FT-rKPT3Tf78RX1G6N5FDlV-A/edit?usp=sharing',
      'name':'青木陸哉',
      'likes': 0,
    });
    await db.collection('works').doc('00220236').set({
      'title': 'iPad、効率的に使ってますか?~縣陵生の学力を向上させるアプリの開発~',
      'category1': 'スポーツ・教育',
      'subCategory1': '教育',
      'category2': 'テクノロジー・工学',
      'subCategory2': 'IT',
      'year': '2019',
      'course': '探究科',
      'report_url':null,
      'thesis_url':null,
      'slide_url':null,
      'poster_url':'https://docs.google.com/document/d/19nI7xrjB4NunYMLAn9FT-rKPT3Tf78RX1G6N5FDlV-A/edit?usp=sharing',
      'name':'務䑓結月',
      'likes': 0,
    });
    await db.collection('works').doc('00220505').set({
      'title': '朝、スッキリ起きられるためには',
      'category1': '健康・医療',
      'subCategory1': '睡眠',
      'category2': 'テクノロジー・工学',
      'subCategory2': 'スマートフォン',
      'year': '2019',
      'course': '普通科',
      'report_url':null,
      'thesis_url':null,
      'slide_url':null,
      'poster_url':'https://docs.google.com/document/d/19nI7xrjB4NunYMLAn9FT-rKPT3Tf78RX1G6N5FDlV-A/edit?usp=sharing',
      'name':'飯田菜央',
      'likes': 0,
    });
    await db.collection('works').doc('00320324').set({
      'title': '黒板とホワイトボードどちらが勉強に最適か',
      'category1': 'スポーツ・教育',
      'subCategory1': '勉強',
      'category2': '科学・数学',
      'subCategory2': '化学',
      'year': '2020',
      'course': '普通科',
      'report_url':null,
      'thesis_url':null,
      'slide_url':null,
      'poster_url':'https://docs.google.com/document/d/19nI7xrjB4NunYMLAn9FT-rKPT3Tf78RX1G6N5FDlV-A/edit?usp=sharing',
      'name':'高木美羽',
      'likes': 0,
    });
    await db.collection('works').doc('00420103').set({
      'title': '人生最大䛾悩み“猫背”ここで治さずいつ治す!?',
      'category1': '健康・医療',
      'subCategory1': 'からだ',
      'category2': 'スポーツ・教育',
      'subCategory2': 'トレーニング',
      'year': '2021',
      'course': '探究科',
      'report_url':null,
      'thesis_url':null,
      'slide_url':null,
      'poster_url':'https://docs.google.com/document/d/19nI7xrjB4NunYMLAn9FT-rKPT3Tf78RX1G6N5FDlV-A/edit?usp=sharing',
      'name':'荒﨑優芽',
      'likes': 0,
    });
    await db.collection('works').doc('00420127').set({
      'title': '交流のできる駄菓子屋を作ろう',
      'category1': 'ビジネス・経済',
      'subCategory1': '店',
      'category2': '地域・社会',
      'subCategory2': 'コミュニティ',
      'year': '2021',
      'course': '探究科',
      'report_url':null,
      'thesis_url':null,
      'slide_url':null,
      'poster_url':'https://docs.google.com/document/d/19nI7xrjB4NunYMLAn9FT-rKPT3Tf78RX1G6N5FDlV-A/edit?usp=sharing',
      'name':'橋本あかり',
      'likes': 0,
    });
    await db.collection('works').doc('00511001').set({
      'title': 'ニジマスのこれから 〜外来種=観光資源?〜',
      'category1': '一次産業',
      'subCategory1': '魚',
      'category2': '自然環境',
      'subCategory2': '外来生物',
      'year': '2022',
      'course': '探究科',
      'report_url':null,
      'thesis_url':null,
      'slide_url':null,
      'poster_url':'https://docs.google.com/document/d/19nI7xrjB4NunYMLAn9FT-rKPT3Tf78RX1G6N5FDlV-A/edit?usp=sharing',
      'name':'橋本昂賢、中畑慧琉',
      'likes': 0,
    });
    await db.collection('works').doc('00411001').set({
      'title': 'お腹の音の悩みを解決しよう！',
      'category1': '健康・医療',
      'subCategory1': 'からだ',
      'category2': 'スポーツ・教育',
      'subCategory2': '勉強',
      'year': '2021',
      'course': '共同',
      'report_url':null,
      'thesis_url':null,
      'slide_url':null,
      'poster_url':'https://docs.google.com/document/d/19nI7xrjB4NunYMLAn9FT-rKPT3Tf78RX1G6N5FDlV-A/edit?usp=sharing',
      'name':'小東聖美、澤木文菜、関谷ひより',
      'likes': 0,
    });
  }

  Future<String> read() async {
    final doc = await db.collection('works').doc('document1').get();
    final text = doc.data().toString();
    return text;
  }
}