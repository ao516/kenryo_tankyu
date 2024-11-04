import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/components/change_info_from_user/export.dart';
import 'package:kenryo_tankyu/models/models.dart';
import '../../constant/value.dart';

class ChangeInfoFromUser extends StatefulWidget {
  final Searched searched;
  const ChangeInfoFromUser(this.searched, {super.key});

  @override
  _ChangeInfoFromUserState createState() => _ChangeInfoFromUserState();
}

class _ChangeInfoFromUserState extends State<ChangeInfoFromUser> {
  ChangeInfoFromUserType? selected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DropdownButtonFormField(
        decoration: const InputDecoration(
          labelText: '理由',
        ),
        selectedItemBuilder: (context) {
          // 調整がシビア
          final maxWidth = MediaQuery.sizeOf(context).width - 70;
          return ChangeInfoFromUserType.values.map((item) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 200,
                maxWidth: maxWidth,
              ),
              child: Text(
                item.displayName,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList();
        },
        onChanged: (value) {
          setState(() {
            selected = ChangeInfoFromUserType.values.firstWhere(
              (element) => element.displayName == value,
            );
          });
        },
        value: selected?.displayName,
        hint: const Text('選択してください'), 
        items: [
          for (final item in ChangeInfoFromUserType.values)
            DropdownMenuItem(
              value: item.displayName,
              child: Text(item.displayName),
            ),
        ],
      ),
      const SizedBox(height: 16),
      (() {
        switch (selected) {
          case ChangeInfoFromUserType.editCategory:
            return EditCategory(searched: widget.searched);
          case ChangeInfoFromUserType.editWorkInfo:
            return EditWorkInfo(searched: widget.searched);
          case ChangeInfoFromUserType.cannotViewPdf:
            return CannotViewPdf();
          case ChangeInfoFromUserType.otherReason:
            return OtherReason();
          default:
            return const SizedBox();
        }
      })(),
      const SizedBox(height: 8),
    ]);
  }
}
