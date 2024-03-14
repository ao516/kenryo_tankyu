import 'package:flutter/material.dart';

class DisplayPdf extends StatefulWidget {
  const DisplayPdf({super.key});

  @override
  State<DisplayPdf> createState() => _DisplayPdfState();
}

class _DisplayPdfState extends State<DisplayPdf> {
  int _selectedChoice = 0;
  final List<String> _choiceList = ['スライド', 'レポート', '論文'];


  @override
  Widget build(BuildContext context) {
    return Row(
      children: _choiceList.map((choice) {
        return Expanded(
          child: ChoiceChip(
            avatar: Container(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            label: Text(choice),
            selected: _choiceList.indexOf(choice) == _selectedChoice,
            onSelected: (selected) {
              setState(() {
                _selectedChoice = _choiceList.indexOf(choice);
              });
            },
          ),
        );
      }).toList(),
    );
  }
}
