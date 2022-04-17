import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../bloc/auth_bloc.dart';

class RegisterPage extends HookWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController.fromValue(TextEditingValue.empty);
    final passwordController = useTextEditingController.fromValue(TextEditingValue.empty);
    final confirmPasswordController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    final _areFieldsEmpty =
        useState<bool>(true); // controll the button based on Text.isEmpty

    bool areFieldsEmpty() {
      return emailController.text.toString().isEmpty ||
          passwordController.text.toString().isEmpty ||
          confirmPasswordController.text.toString().isEmpty;
    }

    useEffect(() {
      emailController.addListener(() {
        _areFieldsEmpty.value = areFieldsEmpty();
      });
      passwordController.addListener(() {
        _areFieldsEmpty.value = areFieldsEmpty();
      });
      confirmPasswordController.addListener(() {
        _areFieldsEmpty.value = areFieldsEmpty();
      });
    }, [
      emailController,
      passwordController,
      confirmPasswordController,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          TextField(
            controller: confirmPasswordController,
            decoration: const InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
          ),
          _areFieldsEmpty.value
              ? const ElevatedButton(
                  child: Text('Login disabled'),
                  onPressed: null,
                )
              : ElevatedButton(
                  child: const Text('Login enabled'),
                  onPressed: () => BlocProvider.of<AuthBloc>(context).add(AuthSignUpEvent(
                    emailController.text.toString(),
                    passwordController.text.toString(),
                  )),
                )
        ],
      ),
    );
  }
}
