import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:kenryo_tankyu/components/favorite.dart';
import 'package:go_router/go_router.dart';

class ResultList extends StatelessWidget {
  final List<AlgoliaObjectSnapshot> data;
  const ResultList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final AlgoliaObjectSnapshot content = data[index];
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: content.data['year'] %3 == 0
                                    ? Colors.red
                                    : content.data['year'] % 3 == 1
                                        ? Colors.green
                                        : Colors.blue,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text('${content.data['year'].toString()}年度入学'),
                            const SizedBox(width: 8),
                            Text(content.data['course']),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(content.data['title'], style: const TextStyle(fontSize: 20),softWrap: true),
                        const SizedBox(height: 4),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Chip(
                                  label: Text(
                                    '${content.data['category1']} > ${content.data['subCategory1']}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  visualDensity: const VisualDensity(vertical: -4),
                                  padding: EdgeInsets.zero),
                              const SizedBox(width: 8),
                              Chip(
                                  label: Text('${content.data['category2']} > ${content.data['subCategory2']}',style: const TextStyle(fontSize: 14)),
                                  visualDensity: const VisualDensity(vertical: -4),
                                  padding: EdgeInsets.zero),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/category/art.png'),
                          width: 50,
                          height: 50,
                        ),
                        Favorite(numberOfFavorite: content.data['likes']),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              context.push('/result',extra: content);
              debugPrint(content.toString());
            },
          );
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
    );
  }
}
