import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:interview_test_project/core/settings/application_settings.dart';
import 'package:interview_test_project/core/wrapper/authentication_wrapper.dart';
import 'package:interview_test_project/modules/auth/screens/register.dart';

import '../../modules/dashboard/screens/dashboard.dart';


var rootHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const HomePage();
});

var loginHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return AuthenticationWrapper();
});
var registerHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const RegisterPage();
});
var settingsHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const SettingsPage();
});
