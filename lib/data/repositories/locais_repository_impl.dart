import 'package:app_flavor_cidades/data/models/local_model.dart';
import 'package:dio/dio.dart';

import './locais_repository.dart';

class LocaisRepositoryImpl implements LocaisRepository {
  final Dio _dio;

  LocaisRepositoryImpl({required Dio dio}) : _dio = dio;
  @override
  Future<List<LocalModel>?> getLocais({required String url}) async {
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      return (response.data as List).map((local) => LocalModel.fromMap(local)).toList();
    }
    return null;
  }
}
