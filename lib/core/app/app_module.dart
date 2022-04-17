import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_test_project/modules/auth/bloc/auth_bloc.dart';
import 'package:interview_test_project/modules/dashboard/bloc/todo_bloc.dart';

import '../../Config/routes/routes.dart';
import '../../config/routes/application.dart';
import '../../config/themes/themes.dart';

class AppComponent extends StatefulWidget {
  const AppComponent({Key? key}) : super(key: key);

  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MultiBlocProvider(
    providers: [
        BlocProvider<AuthBloc>(
      create: (BuildContext context) => AuthBloc()..add(AuthInitialEvent()),
    ),
    BlocProvider<TodoBloc>(create:  (BuildContext context) => TodoBloc()..add(TodoGet()))
    ],
      child: MaterialApp(
        title: 'Fluro',
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeMode.light,
        initialRoute: 'login',
        onGenerateRoute: Application.router.generator,
      ),
    );
    return app;
  }
}
