import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverFailure({required String failureMessage}) =
      _ServerFailure;
  const factory Failure.scrapFailure({required String failureMessage}) =
      _ScrapFailure;
  const factory Failure.localAuthFailure({required String failureMessage}) =
      _LocalAuthFailure;
}
