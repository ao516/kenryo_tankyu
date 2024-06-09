import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final carouselSliderNumberProvider = StateProvider<int>((ref) => 0);

class ContentCarousel extends ConsumerWidget {
  const ContentCarousel({super.key});

  static const imageList = [
    '縣陵先生図鑑',
    '2023トップ',
  ];


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int carouselSliderNumber = ref.watch(carouselSliderNumberProvider);

    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              height: 60,
              initialPage: 0,
              viewportFraction: 1,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                ref
                    .read(carouselSliderNumberProvider.notifier)
                    .state
                = carouselSliderNumber = index;
              }),
          itemCount: imageList.length,
          itemBuilder: (context, index, realIndex) => Text(imageList[index]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.map((url) {
            int index = imageList.indexOf(url);
            return Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 5.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: carouselSliderNumber == index
                    ? const Color.fromRGBO(115, 137, 187, 1)
                    : const Color.fromRGBO(115, 137, 187, 0.4),
              ),
            );
          }).toList(),)
      ],
    );
  }
}