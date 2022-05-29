import 'package:flutter/material.dart';

// placeholder image url
final List<String> sliderItems = [
  'https://cdn.pixabay.com/photo/2019/08/07/14/11/dog-4390885__340.jpg',
  'https://cdn.pixabay.com/photo/2014/10/30/02/52/macaw-508877__340.jpg',
  'https://cdn.pixabay.com/photo/2020/01/18/15/43/parakeet-4775591__340.jpg',
  'https://cdn.pixabay.com/photo/2020/10/28/14/43/cattle-5693737__340.jpg'
];

class BannerImageModel extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double width, height;
  const BannerImageModel(this.image,
      {Key? key, required this.fit, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
