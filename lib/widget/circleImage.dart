import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imagePath;
  final double size;

  const CircleImage({Key? key, required this.imagePath, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.low,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }
}
