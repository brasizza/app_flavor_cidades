import 'package:app_flavor_cidades/core/bindings/application_binding.dart';
import 'package:app_flavor_cidades/pages/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
        debugMode: true,
        modules: [
          HomeModule(),
        ],
        bindings: ApplicationBinding(),
        builder: (context, routes, flutterGetItNavObserver) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: F.title,
            // Adicione aqui o atributo flutterGetItNavObserver
            navigatorObservers: [flutterGetItNavObserver],
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
              useMaterial3: true,
            ),
            // Adicione o atributo das rotas aqui
            routes: routes,
          );
        });
  }
}
