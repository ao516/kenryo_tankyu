import 'package:flutter/material.dart';

class ResultHeader extends StatefulWidget implements PreferredSizeWidget{

  final String searchWord;
  const ResultHeader({Key? key, required this.searchWord}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


  @override
  State<ResultHeader> createState() => _ResultHeaderState();
}

class _ResultHeaderState extends State<ResultHeader> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: SizedBox(
        height: 40,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(

                width: 340,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    Text(widget.searchWord,style: const TextStyle(fontSize: 13)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
