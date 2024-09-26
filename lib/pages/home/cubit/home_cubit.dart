import 'package:app_flavor_cidades/data/models/local_model.dart';
import 'package:app_flavor_cidades/data/services/locais_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final LocaisService _service;

  HomeCubit({required LocaisService service})
      : _service = service,
        super(HomeInitial());

  getLocais() async {
    emit(HomeLoading());
    try {
      final locais = await _service.getLocais();
      emit(HomeLoaded(locais: locais));
    } catch (e) {
      emit(HomeError(error: 'Falha ao recuperar os dados $e'));
    }
  }
}
