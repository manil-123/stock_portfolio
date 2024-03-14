import 'package:dartz/dartz.dart';
import 'package:share_portfolio/core/error/failures.dart';

typedef EitherResponse<T> = Future<Either<Failure, T>>;
