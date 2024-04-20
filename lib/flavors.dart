enum Flavor {
  rj,
  sp,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.rj:
        return 'Guia do Rio de janeiro';
      case Flavor.sp:
        return 'Guia de São Paulo';
      default:
        return 'title';
    }
  }

  static String get url {
    return const String.fromEnvironment('URL_BACKEND');
  }

  static String get cidade {
    return const String.fromEnvironment('CIDADE');
  }
}
