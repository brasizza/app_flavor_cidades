import 'package:app_flavor_cidades/data/models/local_model.dart';

abstract interface class LocaisService {
  Future<List<LocalModel>?> getLocais();
}
