import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_test_project/modules/auth/bloc/auth_bloc.dart';
import 'package:interview_test_project/modules/auth/screens/login.dart';
import 'package:interview_test_project/modules/dashboard/screens/dashboard.dart';

import '../../../constants/firebase_constants.dart';

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
           if (state is AuthSignInSuccesfull) {
            if (state.user.uid.isNotEmpty) {
             return const HomePage();
            } else {
             return const LoginPage();
            }
          } else if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
             return const LoginPage();
          }
      },
    );
  }
}
