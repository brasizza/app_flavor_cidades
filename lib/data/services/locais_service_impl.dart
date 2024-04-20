import 'package:app_flavor_cidades/data/models/local_model.dart';
import 'package:app_flavor_cidades/data/repositories/locais_repository.dart';
import 'package:app_flavor_cidades/flavors.dart';

import './locais_service.dart';

class LocaisServiceImpl implements LocaisService {
  final LocaisRepository _repository;

  LocaisServiceImpl({required LocaisRepository repository}) : _repository = repository;
  @override
  Future<List<LocalModel>?> getLocais() async {
    String url = "${F.url}${F.cidade}";

    return await _repository.getLocais(url: url);
  }
}
