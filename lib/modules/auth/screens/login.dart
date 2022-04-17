import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:interview_test_project/modules/auth/bloc/auth_bloc.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController.fromValue(TextEditingValue.empty);
    final passwordController = useTextEditingController.fromValue(TextEditingValue.empty);

    final _areFieldsEmpty =
        useState<bool>(true); // controll the button based on Text.isEmpty

    bool areFieldsEmpty() {
      return emailController.text.toString().isEmpty ||
          passwordController.text.toString().isEmpty;
    }

    useEffect(() {
      emailController.addListener(() {
        _areFieldsEmpty.value = areFieldsEmpty();
      });
      passwordController.addListener(() {
        _areFieldsEmpty.value = areFieldsEmpty();
      });
    }, [
      emailController,
      passwordController,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Email'),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Password'),
            controller: passwordController,
            obscureText: true,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text("Create Account")),
          _areFieldsEmpty.value
              ? const ElevatedButton(
                  child: Text('Sign in'),
                  onPressed: null,
                )
              : ElevatedButton(
                  child: const Text('Sign in'),
                  onPressed: () => BlocProvider.of<AuthBloc>(context).add(AuthSignInEvent(
                      emailController.text.toString(),
                      passwordController.text.toString())),
                )
        ],
      ),
    );
  }
}
