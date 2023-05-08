import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_portfolio/app/router/app_router.gr.dart';
import 'package:share_portfolio/blocs/auth/auth_bloc.dart';
import 'package:share_portfolio/core/error/failures.dart';
import 'package:share_portfolio/core/widgets/message_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void checkBiometric() async {
    context.read<AuthBloc>().add(
          const AuthEvent.submitAuth(),
        );
  }

  @override
  void initState() {
    super.initState();
    checkBiometric();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            submitting: () {},
            success: () {
              context.router.replace(
                const DashboardRoute(),
              );
            },
            failed: (failure) {
              showErrorInfo(
                context,
                failure.failureMessage,
              );
            },
          );
        },
        builder: (context, state) {
          return state.when(
              initial: () => _authWidget(),
              submitting: () => const Center(
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
              success: () => Container(),
              failed: (failure) {
                return _failureWidget(failure);
              });
        },
      ),
    );
  }

  Widget _authWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => checkBiometric(),
            icon: const Icon(
              Icons.fingerprint,
              color: Colors.white,
              size: 50,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Text('Press here to login'),
        ],
      ),
    );
  }

  Widget _failureWidget(Failure failure) {
    return Center(
      child: Text(failure.failureMessage),
    );
  }
}
