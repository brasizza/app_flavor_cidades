import 'package:app_flavor_cidades/pages/home/cubit/home_cubit.dart';
import 'package:app_flavor_cidades/pages/home/widgets/list_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_getit/flutter_getit.dart';
import '../../flavors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: context.get(),
        builder: (context, state) {
          return switch (state) {
            HomeInitial() => const SizedBox(),
            HomeLoading() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            HomeLoaded() => ListLocal(locais: state.locais ?? []),
            HomeError() => Center(
                child: Text(state.error),
              )
          };
        },
      ),
    );
  }
}
