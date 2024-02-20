import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      backgroundColor: Colors.grey.shade200,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Expanded(
          child: SizedBox(
            height: 40,
            child: InkWell(
              onTap: () => context.pop(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 16)),
                    const Icon(Icons.search),
                    const Padding(padding: EdgeInsets.only(left: 12)),
                    Text(widget.searchWord,
                      style: const TextStyle(fontSize: 16,color: Colors.black54),
                    ),
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
