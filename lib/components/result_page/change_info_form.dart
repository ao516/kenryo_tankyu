import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/models/models.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import 'package:kenryo_tankyu/service/service.dart';

import '../../constant/value.dart';

///全体で使うProvider
final selectedChangeInfoDropdownProvider =
    StateProvider.autoDispose<String?>((ref) => null);

final enabledChangeInfoButtonProvider =
    StateProvider.autoDispose<bool>((ref) => false);

///「カテゴリの分類が不適切」の際に使うProvider等
enum RadioValue { category1, category2 }

final selectedRadioProvider =
    StateProvider.autoDispose<RadioValue>((ref) => RadioValue.category1);
final selectedCategoryProvider =
    StateProvider.autoDispose<Category>((ref) => Category.none);
final selectedSubCategoryProvider =
    StateProvider.autoDispose<SubCategory>((ref) => SubCategory.none);

///「作品の情報が間違っている」の際に使うProvider等
final selectedCourseProvider = StateProvider.autoDispose<Course>(
    (ref) => ref.watch(searchedProvider).course);
final selectedEnterYearProvider =
    StateProvider.autoDispose<EnterYear>((ref) => ref.watch(searchedProvider).enterYear);
final selectedAuthorControllerProvider =
    StateProvider.autoDispose<TextEditingController>((ref) =>
        TextEditingController(text: ref.watch(searchedProvider).author));
final selectedTitleControllerProvider =
    StateProvider.autoDispose<TextEditingController>((ref) =>
        TextEditingController(text: ref.watch(searchedProvider).title));

///「PDFが閲覧できない」の際に使うProvider等
final selectedCannotViewPdfProvider = StateProvider.autoDispose<List<bool>>(
    (ref) => List.generate(pdfChoiceList.length, (index) => false));
final freeDescriptionControllerProviderForCannotViewPdf =
    StateProvider.autoDispose<TextEditingController>(
        (ref) => TextEditingController());

///「その他」の際に使うProvider等
final freeDescriptionControllerProviderForOtherReason =
    StateProvider.autoDispose<TextEditingController>(
        (ref) => TextEditingController());

class ChangeInfoForm extends ConsumerWidget {
  final Searched searched;
  const ChangeInfoForm(this.searched, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? selected = ref.watch(selectedChangeInfoDropdownProvider);
    final selectedNotifier =
        ref.read(selectedChangeInfoDropdownProvider.notifier);
    final bool enabledChangeInfoButton =
        ref.watch(enabledChangeInfoButtonProvider);
    final enableNotifier = ref.read(enabledChangeInfoButtonProvider.notifier);
    return Column(children: [
      DropdownButtonFormField(
        decoration: const InputDecoration(
          labelText: '理由',
        ),
        selectedItemBuilder: (context) {
          // 調整がシビア
          final maxWidth = MediaQuery.sizeOf(context).width - 70;
          return changeInfoList.map((item) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 200,
                maxWidth: maxWidth,
              ),
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList();
        },
        items: changeInfoList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (value) {
          selectedNotifier.state = value;
          enableNotifier.state = false;
        },
        value: selected,
        hint: const Text('選択してください'),
      ),
      const SizedBox(height: 16),
      //即時関数面白いなぁ。初めて使った。
      (() {
        switch (changeInfoList.indexOf(selected ?? '')) {
          case 0: //カテゴリの分類が不適切
            return suggestOtherCategory(ref, searched);
          case 1: //作品の情報が間違っている
            return suggestWorksInfo(ref, searched);
          case 2: //PDFが閲覧できない
            return cannotViewPdf(ref);
          case 3: //その他
            return otherReason(ref);
          case -1:
            return const SizedBox();
          default:
            return const SizedBox();
        }
      })(),
      const SizedBox(height: 8),
      ElevatedButton(
        onPressed: enabledChangeInfoButton
            ? () async {
                Navigator.of(context).pop();
                await EditSpreadSheet.instance
                    .editSpreadSheet(context, ref, searched, selected);
              }
            : null,
        child: const Text('送信する'),
      ),
    ]);
  }

  Widget suggestOtherCategory(WidgetRef ref, Searched searched) {
    final RadioValue selectedRadio = ref.watch(selectedRadioProvider);
    final Category selectedCategory = ref.watch(selectedCategoryProvider);
    final SubCategory selectedSubCategory =
        ref.watch(selectedSubCategoryProvider);
    final radioNotifier = ref.read(selectedRadioProvider.notifier);
    final categoryNotifier = ref.read(selectedCategoryProvider.notifier);
    final subCategoryNotifier = ref.read(selectedSubCategoryProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('どちらのカテゴリを修正しますか',
            style: TextStyle(fontWeight: FontWeight.bold)),

        //todo この２つのradioListTileは、ListTile.builderを使った方がパフォーマンスが良いかも。（pdfが閲覧できない、の方では採用している）
        RadioListTile<RadioValue>(
          contentPadding: EdgeInsets.zero,
          title: Text(
              '${searched.category1.displayName}\n>${searched.subCategory1.displayName}'),
          value: RadioValue.category1,
          groupValue: selectedRadio,
          onChanged: (RadioValue? value) {
            if (value != null) {
              radioNotifier.state = value;
            }
          },
        ),
        RadioListTile<RadioValue>(
          contentPadding: EdgeInsets.zero,
          title: Text(
              '${searched.category2.displayName}\n>${searched.subCategory2.displayName}'),
          value: RadioValue.category2,
          groupValue: selectedRadio,
          onChanged: (RadioValue? value) {
            if (value != null) {
              radioNotifier.state = value;
            }
          },
        ),
        const SizedBox(height: 16),
        const Text('修正後のカテゴリ', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            hintText: 'メインカテゴリ',
            border: OutlineInputBorder(),
            isDense: true,
          ),
          value: selectedCategory,
          items:
              Category.values.map<DropdownMenuItem<Category>>((Category value) {
            return DropdownMenuItem(
                value: value, child: Text(value.displayName));
          }).toList(),
          onChanged: (value) {
            categoryNotifier.state = value!;
            ref.read(enabledChangeInfoButtonProvider.notifier).state = false;
          },
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField(
            decoration: const InputDecoration(
              hintText: 'サブカテゴリ',
              border: OutlineInputBorder(),
              isDense: true,
            ),
            value: selectedSubCategory,
            items: selectedCategory == Category.none
                ? [
                    const DropdownMenuItem(
                      enabled: false,
                      value: SubCategory.none,
                      child:
                          Text('メインカテゴリを先に選択', overflow: TextOverflow.ellipsis),
                    )
                  ]
                : selectedCategory.subCategories
                    .where((e) =>
                        e != SubCategory.none) // Exclude SubCategory.none
                    .map((e) {
                    return DropdownMenuItem(
                        value: e, child: Text(e.displayName));
                  }).toList(),
            onChanged: (value) {
              subCategoryNotifier.state = value!;
              ref.read(enabledChangeInfoButtonProvider.notifier).state = true;
            }),
      ],
    );
  }

  Widget suggestWorksInfo(WidgetRef ref, Searched searched) {
    final Course selectedCourse = ref.watch(selectedCourseProvider);
    final EnterYear selectedYear = ref.watch(selectedEnterYearProvider);
    final courseNotifier = ref.read(selectedCourseProvider.notifier);
    final yearNotifier = ref.read(selectedEnterYearProvider.notifier);
    final enabledChangeInfoButtonNotifier =
        ref.read(enabledChangeInfoButtonProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('間違っている箇所の訂正をお願いします',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        TextFormField(
          onChanged: (value) => enabledChangeInfoButtonNotifier.state = true,
          controller: ref.watch(selectedAuthorControllerProvider),
          decoration: const InputDecoration(
            isDense: true,
            labelText: '名前',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          onChanged: (value) => enabledChangeInfoButtonNotifier.state = true,
          minLines: 2,
          maxLines: 3,
          controller: ref.watch(selectedTitleControllerProvider),
          decoration: const InputDecoration(
            isDense: true,
            labelText: 'タイトル',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: '学科',
            border: OutlineInputBorder(),
            isDense: true,
          ),
          value: selectedCourse,
          items: Course.values
              .map<DropdownMenuItem<Course>>((Course value) => DropdownMenuItem(
                  value: value, child: Text(value.displayName)))
              .toList(),
          onChanged: (value) {
            enabledChangeInfoButtonNotifier.state = true;
            courseNotifier.state = Course.values.firstWhere(
                (element) => element == value,
                orElse: () => Course.undefined);
          },
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: '入学年度',
            border: OutlineInputBorder(),
            isDense: true,
          ),
          value: selectedYear.toString(),
          items: EnterYear.values
              .map<DropdownMenuItem<EnterYear>>((EnterYear value) => DropdownMenuItem(
                  value: value, child: Text(value.displayName.toString())))
              .toList(),
          onChanged: (value) {
            enabledChangeInfoButtonNotifier.state = true;
            yearNotifier.state = EnterYear.values.firstWhere(
                (element) => element.displayName.toString() == value,
                orElse: () => EnterYear.undefined);
          },
        ),
      ],
    );
  }

  Widget cannotViewPdf(WidgetRef ref) {
    final List<bool> selectedCannotViewPdf =
        ref.watch(selectedCannotViewPdfProvider);
    final notifier = ref.read(selectedCannotViewPdfProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('問題のあるPDFを選択してください',
            style: TextStyle(fontWeight: FontWeight.bold)),
        ListView.builder(
            shrinkWrap: true,
            itemCount: pdfChoiceList.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(pdfChoiceList[index]),
                value: selectedCannotViewPdf[index],
                onChanged: (bool? value) {
                  ref.read(enabledChangeInfoButtonProvider.notifier).state =
                      true;
                  selectedCannotViewPdf.removeAt(index);
                  selectedCannotViewPdf.insert(index, value!);
                  notifier.state = [...selectedCannotViewPdf];
                },
              );
            }),
        TextFormField(
          controller:
              ref.watch(freeDescriptionControllerProviderForCannotViewPdf),
          maxLines: 3,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: '自由記述',
          ),
        ),
      ],
    );
  }

  Widget otherReason(WidgetRef ref) {
    return TextFormField(
      controller: ref.watch(freeDescriptionControllerProviderForOtherReason),
      onChanged: (value) {
        ref.read(enabledChangeInfoButtonProvider.notifier).state =
            value.isNotEmpty;
      },
      maxLines: 5,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'テキスト',
      ),
    );
  }
}
