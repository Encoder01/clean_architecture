import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_test_project/modules/auth/bloc/auth_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Settings'),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(AuthExitEvent());
                  Navigator.pop(context);
                },
                child: Text("Sign Out"))
          ],
        ),
      ),
    );
  }
}
