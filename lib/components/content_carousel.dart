import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ContentCarousel extends StatelessWidget {
  const ContentCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
      ),
      items: [1, 2, 3].map((i) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: const BoxDecoration(color: Colors.amber),
          child: Text('text $i', style: const TextStyle(fontSize: 16.0)),
        );
      }).toList(),
    );
  }
}
