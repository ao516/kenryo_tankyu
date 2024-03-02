import 'package:flutter/foundation.dart';

/// 見たまんまです。
/// categoryList[index][0] → カテゴリの名前
/// categoryList[index].length - 1 →サブカテゴリの要素数
/// categoryList[index][i + 1] →サブカテゴリを順番に取っていきたいとき
/// ってな感じです。自由に使ってください。

const categoryList = [
  ['防災', '観光', '市政', '政治'],
  ['歴史', '言語', '地理', '心理', '哲学'],
  ['ジェンダー', '子供の権利', '貧困'],
  ['国際協力', '海外問題'],
  ['ビジネス', 'マーケティング', '経済', 'エシカル消費'],
  ['農業', '水産業', '林業'],
  ['スポーツ', '幼児教育', '学校教育'],
  ['水資源', '森資源', '生物', '地学', 'エシカル'],
  ['数学', '化学', '物理'],
  ['コンピューター', 'ロボット', '機械工学', 'ＩＣＴ'],
  ['健康', '美容', '医療'],
  ['アート', 'デザイン', '音楽'],
  ['食', '学校生活', '図書'],
];