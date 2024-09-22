//2024年度用
import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/model/teacher.dart';

final List<Teacher> teacherList =
    [
      Teacher(name: '日下部英二', nameKana: 'くさかべえいじ', nameEn: 'KusakabeEiji', subject: SubjectType.japanese, grade: GradeInCharge.first),
      Teacher(name: '山田太郎', nameKana: 'やまだたろう', nameEn: 'YamadaTaro', subject: SubjectType.math, grade: GradeInCharge.second),
      Teacher(name: '佐藤花子', nameKana: 'さとうはなこ', nameEn: 'SatoHanako', subject: SubjectType.science, grade: GradeInCharge.third),
      Teacher(name: '田中次郎', nameKana: 'たなかじろう', nameEn: 'TanakaJiro', subject: SubjectType.social, grade: GradeInCharge.other),
      Teacher(name: '鈴木三郎', nameKana: 'すずきさぶろう', nameEn: 'SuzukiSaburo', subject: SubjectType.english, grade: GradeInCharge.first),
      Teacher(name: '高橋四郎', nameKana: 'たかはしじろう', nameEn: 'TakahashiShiro', subject: SubjectType.pe, grade: GradeInCharge.second),
      Teacher(name: '渡辺五郎', nameKana: 'わたなべごろう', nameEn: 'WatanabeGoro', subject: SubjectType.office, grade: GradeInCharge.third),
      Teacher(name: '伊藤六郎', nameKana: 'いとうろくろう', nameEn: 'ItoRokuro', subject: SubjectType.other, grade: GradeInCharge.other),
      Teacher(name: '加藤七郎', nameKana: 'かとうしちろう', nameEn: 'KatoShichiro', subject: SubjectType.japanese, grade: GradeInCharge.first),
      Teacher(name: '山口八郎', nameKana: 'やまぐちはちろう',nameEn: 'YamaguchiHachiro', subject: SubjectType.math, grade: GradeInCharge.second),
      Teacher(name: '中村九郎', nameKana: 'なかむらくろう', nameEn: 'NakamuraKuro', subject: SubjectType.science, grade: GradeInCharge.third),
      Teacher(name: '小林十郎', nameKana: 'こばやしじゅうろう', nameEn: 'KobayashiJuro', subject: SubjectType.social, grade: GradeInCharge.other),
      Teacher(name: '加藤十一郎', nameKana: 'かとうじゅういちろう', nameEn: 'KatoJuichiro', subject: SubjectType.english, grade: GradeInCharge.first),
      Teacher(name: '山本十二郎', nameKana: 'やまもとじゅうにろう', nameEn: 'YamamotoJuniro', subject: SubjectType.pe, grade: GradeInCharge.second),
      Teacher(name: '佐々木十三郎', nameKana: 'ささきじゅうさんろう', nameEn: 'SasakiJusanro', subject: SubjectType.office, grade: GradeInCharge.third),
      Teacher(name: '松本十四郎', nameKana: 'まつもとじゅうしろう', nameEn: 'MatsumotoJushiro', subject: SubjectType.other, grade: GradeInCharge.other),
      Teacher(name: '山田十五郎', nameKana: 'やまだじゅうごろう', nameEn: 'YamadaJugoro', subject: SubjectType.japanese, grade: GradeInCharge.first),
      Teacher(name: '佐藤十六郎', nameKana: 'さとうじゅうろくろう', nameEn: 'SatoJuroku', subject: SubjectType.math, grade: GradeInCharge.second),
      Teacher(name: '田中十七郎', nameKana: 'たなかじゅうしちろう', nameEn: 'TanakaJushichiro', subject: SubjectType.science, grade: GradeInCharge.third),
    ];

//enum 定義
