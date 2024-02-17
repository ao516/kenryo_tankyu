import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InitialHeader extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const InitialHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              onTap: () => context.go('/search'),
              child: Container(
                width: 340,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: const Column(
                  children: [
                    Text('検索バー',style: TextStyle(fontSize: 13),)
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

