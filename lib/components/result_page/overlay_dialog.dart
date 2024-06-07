import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/components/components.dart';

class OverlayDialog extends ModalRoute<void> {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
  @override
  bool get opaque => false;
  @override
  bool get barrierDismissible => true;
  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);
  @override
  String get barrierLabel => 'Custom Dialog';
  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: _buildDialogContent(context),
      ),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFDAD7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 0),
              const Text(
                '情報の変更を提案',
                style: TextStyle(fontSize: 18),
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const ChangeInfoForm(),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('送信する'),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
