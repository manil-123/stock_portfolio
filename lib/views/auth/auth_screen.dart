import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:share_portfolio/app/router/app_router.gr.dart';
import 'package:share_portfolio/services/local_auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void checkBiometric() async {
    final authenticate = await LocalAuthService.authenticate();
    if (authenticate) {
      context.router.replace(
        const DashboardRoute(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    checkBiometric();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final authenticate = await LocalAuthService.authenticate();
            if (authenticate) {
              context.router.replace(
                const DashboardRoute(),
              );
            }
          },
          child: Text('Authenticate'),
        ),
      ),
    );
  }
}
