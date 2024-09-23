import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/constant/constant.dart';
import 'package:kenryo_tankyu/models/models.dart';

class EditSpreadSheet {
  static final EditSpreadSheet _instance = EditSpreadSheet._internal();
  EditSpreadSheet._internal();
  static EditSpreadSheet get instance => _instance;

  static const sheetListRange = [
    'suggest_other_category!A1:G1',
    'suggest_works_info!A1:F1',
    'cannot_view_pdf!A1:F1',
    'other_reason!A1:C1'
  ];

  Future<void> editSpreadSheet(BuildContext context, WidgetRef ref,
      Searched searched, String? selected) async {
    int number = lookUpType(selected);
    String? userEmail =  FirebaseAuth.instance.currentUser?.email;
    List<String> values = decideValues(number, ref, searched);
    await addDataToSheet(
        sheetListRange[number], values, userEmail?? 'guest', searched.documentID);
  }

  Future<void> addDataToSheet(String range, List<String> values,
      String userEmail, String documentID) async {
    // 認証情報ファイルの読み込み
    final credentials = await rootBundle
        .loadString('assets/your_service_account_credentials.json');
    final jsonCredentials = jsonDecode(credentials);

    // OAuth2クライアントを作成
    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(jsonCredentials),
      [SheetsApi.spreadsheetsScope],
    );

    final sheetsApi = SheetsApi(client);

    // スプレッドシートのIDと範囲を指定
    const spreadsheetId = '1g9kG-6wlBxWQ-kq4tyFtWjRJvJbWqLNLoJ_C67WYmaw';

    values = [userEmail, documentID, ...values];
    var request = ValueRange(values: [values]);

    // スプレッドシートにデータを追加
    await sheetsApi.spreadsheets.values
        .append(request, spreadsheetId, range, valueInputOption: 'RAW');
  }

  int lookUpType(String? selected) {
    switch (changeInfoList.indexOf(selected ?? '')) {
      case 0: //カテゴリの分類が不適切
        return 0;
      case 1: //作品の情報が間違っている
        return 1;
      case 2: //PDFが閲覧できない
        return 2;
      case 3: //その他
        return 3;
      case -1:
        return -1;
    }
    return 1;
  }

  List<String> decideValues(int number, WidgetRef ref,Searched searched) {
    switch (number) {
      case 0: //カテゴリの分類が不適切
        int selectedRadioNumber = ref.watch(selectedRadioProvider).index;
        String selectedBeforeCategory = selectedRadioNumber == 0 ? searched.category1 : searched.category2;
        String selectedBeforeSubCategory = selectedRadioNumber == 0 ? searched.subCategory1 : searched.subCategory2;
        String? selectedCategory = ref.watch(selectedCategoryProvider);
        String? selectedSubCategory = ref.watch(selectedSubCategoryProvider);
        return [
          selectedBeforeCategory,
          selectedBeforeSubCategory,
          selectedCategory ?? '',
          selectedSubCategory ?? ''
        ];
      case 1: //作品の情報が間違っている
        String selectedTitle = ref.watch(selectedTitleControllerProvider).text;
        String selectedAuthor =
            ref.watch(selectedAuthorControllerProvider).text;
        String selectedDepartment = ref.watch(selectedDepartmentProvider);
        String selectedYear = ref.watch(selectedYearProvider).toString();
        return [
          selectedTitle,
          selectedAuthor,
          selectedDepartment,
          selectedYear
        ];
      case 2: //PDFが閲覧できない
        List<bool> selectedCannotViewPdf =
            ref.watch(selectedCannotViewPdfProvider);
        List<String> selectedCannotViewPdfString = selectedCannotViewPdf
            .map((e) => e ? '問題あり' : '問題なし').toList();
        String freeDescription = ref.watch(freeDescriptionControllerProviderForCannotViewPdf).text;
        return [...selectedCannotViewPdfString, freeDescription];
      case 3: //その他
        String freeDescription = ref.watch(freeDescriptionControllerProviderForOtherReason).text;
        return [freeDescription];
      default:
        return [];
    }
  }
}
