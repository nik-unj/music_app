import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final double size;
  final Color bgColor;
  final VoidCallback onTap;
  final Icon iconData;

  const CircleButton(
      {Key? key,
      required this.size,
      required this.bgColor,
      required this.onTap,
      required this.iconData})
      : super(key: key);

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: widget.iconData,
      ),
    );
  }
}
