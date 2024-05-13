import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/components/components.dart';
import 'package:kenryo_tankyu/providers/providers.dart';
import '../service/service.dart';

class ResultList extends ConsumerWidget {
  final List<Searched> data;
  const ResultList({super.key, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      child: RefreshIndicator(
        onRefresh: () async{
          ref.invalidate(algoliaSearchProvider);
        } ,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final Searched searched = data[index];
            return Consumer(builder: (context, ref, child) {
              return ResultPreviewContent(searched: searched);
            });
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            );
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}
