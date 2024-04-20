import 'package:app_flavor_cidades/data/models/local_model.dart';

abstract interface class LocaisRepository {
  Future<List<LocalModel>?> getLocais({required String url});
}
