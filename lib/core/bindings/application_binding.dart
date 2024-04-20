import 'package:dio/dio.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ApplicationBinding extends ApplicationBindings {
  // retorne em um array todas as dependências de aplicação
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton<Dio>((i) => Dio()),
      ];
}
