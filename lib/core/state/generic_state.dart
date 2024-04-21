import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_state.freezed.dart';

@freezed
class GenericState<T> with _$GenericState<T> {
  const factory GenericState.initial() = _GenericInitial;

  const factory GenericState.loading() = GenericLoading;

  const factory GenericState.success(T data) = GenericSuccess<T>;

  const factory GenericState.error({required String message}) = _GenericError;
}
