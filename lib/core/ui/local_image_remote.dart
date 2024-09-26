import 'package:flutter/material.dart';

class LocalImageRemove extends StatelessWidget {
  final String path;
  final double? width;

  const LocalImageRemove({super.key, required this.path, this.width});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: path,
      child: Image.network(
        width: width,
        fit: BoxFit.contain,
        path,
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox(
            height: 200,
          );
        },
      ),
    );
  }
}
