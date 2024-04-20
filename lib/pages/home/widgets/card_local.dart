import 'package:app_flavor_cidades/core/ui/local_image_remote.dart';
import 'package:app_flavor_cidades/data/models/local_model.dart';
import 'package:flutter/material.dart';

class CardLocal extends StatelessWidget {
  final LocalModel local;

  const CardLocal({super.key, required this.local});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/detail', arguments: {'local': local}),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                local.local,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LocalImageRemove(path: local.imagem),
            ),
          ],
        ),
      ),
    );
  }
}
