import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/models/models.dart';

class EditWorkInfo extends StatefulWidget {
  final Searched searched;
  EditWorkInfo({super.key, required this.searched});

  @override
  State<EditWorkInfo> createState() => _EditWorkInfoState();
}

class _EditWorkInfoState extends State<EditWorkInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  Course? _selectedCourse;
  EnterYear? _selectedYear;

  @override
  void initState() {
    super.initState();
    _authorController.text = widget.searched.author;
    _titleController.text = widget.searched.title;
    _selectedCourse = Course.values.firstWhere(
        (element) => element == widget.searched.course,
        orElse: () => Course.undefined);
    _selectedYear = EnterYear.values.firstWhere(
        (element) => element == widget.searched.enterYear,
        orElse: () => EnterYear.undefined);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('間違っている箇所の訂正をお願いします',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextFormField(
            controller: _authorController,
            decoration: const InputDecoration(
              isDense: true,
              labelText: '名前',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            minLines: 2,
            maxLines: 3,
            controller: _titleController,
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
            value: _selectedCourse,
            items: Course.values
                .map<DropdownMenuItem<Course>>((Course value) =>
                    DropdownMenuItem(
                        value: value, child: Text(value.displayName)))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedCourse = value;
              });
            },
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField(
            decoration: const InputDecoration(
              labelText: '入学年度',
              border: OutlineInputBorder(),
              isDense: true,
            ),
            value: _selectedYear,
            items: EnterYear.values
                .map<DropdownMenuItem<EnterYear>>((EnterYear value) =>
                    DropdownMenuItem(
                        value: value,
                        child: Text(value.displayName.toString())))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedYear = value;
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('名前: ${_authorController.text}');
                print('タイトル: ${_titleController.text}');
                print('学科: ${_selectedCourse?.displayName}');
                print('入学年度: ${_selectedYear?.displayName}');
              }
            },
            child: const Text('保存'),
          ),
        ],
      ),
    );
  }
}
