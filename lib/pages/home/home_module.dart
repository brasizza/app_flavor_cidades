import 'package:app_flavor_cidades/data/repositories/locais_repository.dart';
import 'package:app_flavor_cidades/data/repositories/locais_repository_impl.dart';
import 'package:app_flavor_cidades/data/services/locais_service.dart';
import 'package:app_flavor_cidades/data/services/locais_service_impl.dart';
import 'package:app_flavor_cidades/pages/home/cubit/home_cubit.dart';
import 'package:app_flavor_cidades/pages/home/detail/detail_page.dart';
import 'package:app_flavor_cidades/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeModule extends FlutterGetItModule {
  // Bindings do módulo como um todo
  @override
  List<Bind> get bindings => [
        Bind.lazySingleton<LocaisRepository>((i) => LocaisRepositoryImpl(dio: i())),
        Bind.lazySingleton<LocaisService>((i) => LocaisServiceImpl(repository: i())),
        Bind.factory<HomeCubit>((i) => HomeCubit(service: i())..getLocais()),
      ];

  // Caminho base do seu módulo
  @override
  String get moduleRouteName => '/';

  // Páginas do seu módulo
  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
      };
}
