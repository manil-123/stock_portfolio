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
  final LocalAuthService _localAuthService;
  AuthBloc(this._localAuthService)
      : super(
          const AuthState.initial(),
        ) {
    on<_SubmitAuth>(
      (event, emit) async {
        final authResponse = await _localAuthService.authenticate();
        emit(
          const AuthState.submitting(),
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
              const AuthState.success(),
            );
          },
        );
      },
    );
  }
}
