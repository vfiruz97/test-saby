import 'package:flutter/material.dart';

class DotButtonWidget extends StatelessWidget {
  const DotButtonWidget({
    Key? key,
    required this.showActiveColor,
    required this.onTap,
  }) : super(key: key);

  final bool showActiveColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: showActiveColor ? Colors.blue : Colors.grey,
        child: InkWell(
          onTap: () => onTap(),
          child: const SizedBox(width: 10, height: 10),
        ),
      ),
    );
  }
}
