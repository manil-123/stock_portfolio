import 'package:dartz/dartz.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/error/exception.dart';
import 'package:share_portfolio/core/error/failures.dart';
import 'package:share_portfolio/core/typedef/typedefs.dart';

/// {@template base_repository}
/// A [BaseRepository] class for handling network status and exceptions.
///
/// Methods should return EitherResponse.
/// {@endtemplate}
class BaseRepository {
  BaseRepository();

  /// [T] is Return type for [EitherResponse]
  EitherResponse<T> handleNetworkCall<T>({
    required Future<T> call,
  }) async {
    try {
      final data = await call;
      return Right(data);
    } on ScrapException catch (e) {
      return Left(
        Failure.scrapFailure(
          failureMessage: e.exceptionMessage,
        ),
      );
    } on NoInternetException {
      return const Left(
        Failure.networkFailure(
          failureMessage: ErrorMsg.noInternetConnection,
        ),
      );
    } catch (e) {
      return Left(
        Failure.serverFailure(
          failureMessage: e.toString(),
        ),
      );
    }
  }
}
