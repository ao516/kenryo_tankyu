import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kenryo_tankyu/components/header/initial_header.dart';

class Footer extends StatefulWidget {
  final Widget child;
  const Footer({super.key,  required this.child});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const InitialHeader(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'ホーム'),
          NavigationDestination(icon: Icon(Icons.explore), label: '探索'),
          NavigationDestination(icon: Icon(Icons.bookmarks), label: 'ライブラリ'),
        ],
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              _selectedIndex = 0;
              context.push('/home');
              break;
            case 1:
              _selectedIndex = 1;
              context.push('/explore');
              break;
            case 2:
              _selectedIndex = 2;
              context.push('/library');
              break;
            default:
              _selectedIndex = 0;
              context.push('/home');
          }
          setState(() {});
        },
      ),
      body: widget.child,
    );
  }
}