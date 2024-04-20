import 'package:app_flavor_cidades/data/models/local_model.dart';
import 'package:app_flavor_cidades/pages/home/widgets/card_local.dart';
import 'package:flutter/material.dart';

class ListLocal extends StatelessWidget {
  final List<LocalModel> locais;

  const ListLocal({super.key, required this.locais});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locais.length,
      itemBuilder: (context, index) {
        final local = locais[index];
        return CardLocal(local: local);
      },
    );
  }
}
