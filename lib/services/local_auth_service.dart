import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:share_portfolio/core/error/failures.dart';

@LazySingleton()
class LocalAuthService {
  final _auth = LocalAuthentication();

  Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  Future<Either<Failure, bool>> authenticate() async {
    try {
      if (!await _canAuthenticate())
        return const Left(
          Failure.localAuthFailure(failureMessage: "Device not supported"),
        );

      final didAuthenticate = await _auth.authenticate(
        localizedReason: 'Fingerprint required to authenticate',
        options: const AuthenticationOptions(
            useErrorDialogs: true, stickyAuth: true),
      );
      if (didAuthenticate) {
        return Right(didAuthenticate);
      } else {
        return const Left(
          Failure.localAuthFailure(failureMessage: "Please Enter Biometric"),
        );
      }
    } catch (e) {
      debugPrint('error $e');
      return const Left(
        Failure.localAuthFailure(failureMessage: "Local Auth Exception"),
      );
    }
  }
}
