import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@LazySingleton()
class LocalAuthService {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuthenticate()) return false;

      return await _auth.authenticate(
        localizedReason: 'Fingerprint required to authenticate',
        options: AuthenticationOptions(useErrorDialogs: true, stickyAuth: true),
      );
    } catch (e) {
      debugPrint('error $e');
      return false;
    }
  }
}
