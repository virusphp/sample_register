import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:samble_registrasi/data/dataresources/auth_datasources.dart';
import 'package:samble_registrasi/data/models/request/register_request_model.dart';
import 'package:samble_registrasi/data/models/response/register_response_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDatasource datasource;
  RegisterBloc(
    this.datasource,
  ) : super(RegisterInitial()) {
    on<DoRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      // kirim register request model => data source, menunggu response
      // emit(RegisterLoaded());
      final result = await datasource.register(event.model);

      result.fold(
        (error) {
          emit(RegisterError(message: error));
        },
        (data) {
          emit(RegisterLoaded(model: data));
        },
      );
    });
  }
}
