import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:share_portfolio/core/error/failures.dart';
import 'package:share_portfolio/services/local_auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@LazySingleton()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LocalAuthService localAuthService;
  AuthBloc(this.localAuthService)
      : super(
          AuthState.initial(),
        ) {
    on<_SubmitAuth>(
      (event, emit) async {
        final authResponse = await localAuthService.authenticate();
        emit(
          AuthState.submitting(),
        );
        Future.delayed(const Duration(seconds: 1));
        authResponse.fold(
          (failure) {
            emit(
              AuthState.failed(failure: failure),
            );
          },
          (success) {
            emit(
              AuthState.success(),
            );
          },
        );
      },
    );
  }
}
