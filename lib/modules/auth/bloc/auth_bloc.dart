import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../constants/firebase_constants.dart';
import '../../../utils/services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthInitialEvent) {
        if (auth.currentUser!.uid.isNotEmpty) {
          emit(AuthSignInSuccesfull(auth.currentUser!));
        } else {
          emit(AuthSignOut());
        }
      } else if (event is AuthSignInEvent) {
        emit(AuthLoading());
        User? usr = await AuthService().login(event.email, event.password);
        if (usr!.uid.isEmpty) {
          //todo snackbar
          emit(AuthSignOut());
        }
        if (usr.uid.isNotEmpty) {
          User? usr = await AuthService().login(event.email, event.password);
          emit(AuthSignInSuccesfull(usr!));
        }
      } else if (event is AuthSignUpEvent) {
        emit(AuthLoading());
        User? usr = await AuthService().register(event.email, event.password);
        emit(AuthSignInSuccesfull(usr!));
      } else if (event is AuthExitEvent) {
        emit(AuthLoading());
        await AuthService().signOut();
        emit(AuthSignOut());
      }
    });
  }
}
