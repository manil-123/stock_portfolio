import 'package:dartz/dartz.dart';
import 'package:share_portfolio/core/constants/string_constants.dart';
import 'package:share_portfolio/core/error/failures.dart';
import 'package:share_portfolio/core/network/network_info.dart';
import 'package:share_portfolio/core/typedef/typedefs.dart';

/// {@template base_repository}
/// A [BaseRepository] class for handling network status and exceptions.
///
/// Methods should return EitherResponse.
/// {@endtemplate}
class BaseRepository {
  BaseRepository(this.networkInfo);

  final NetworkInfo networkInfo;

  /// [T] is Return type for [EitherResponse]
  EitherResponse<T> handleNetworkCall<T>({
    required Future<T> call,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await call;
        return Right(data);
      } catch (e) {
        return Left(
          Failure.serverFailure(
            failureMessage: e.toString(),
          ),
        );
      }
    } else {
      return const Left(
        Failure.networkFailure(failureMessage: ErrorMsg.noInternetConnection),
      );
    }
  }
}
