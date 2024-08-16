import 'package:flutter/material.dart';

class FeelingButton extends StatelessWidget {
  final String label;
  final Color color;
  final String image;
  final VoidCallback onPressed;
  const FeelingButton({
    super.key,
    required this.label,
    required this.color,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
            child: Image.asset(image, height: 25),
          ),
          Text(label, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
