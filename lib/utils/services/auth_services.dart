import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/firebase_constants.dart';

class AuthService {
  Future<User?> register(email, password) async {
    var credentinal =
        await auth.createUserWithEmailAndPassword(email: email, password: password);
    return credentinal.user;
  }

  Future signOut() async {
    await auth.signOut();
  }

  Future<User?> login(String email, String password) async {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
    /*if (!userCredential.user!.emailVerified) {
        signOut();
        return "Please confirm your email address";
      } else {
        UID = _firebaseAuth.currentUser!.uid;
        return "true";
      }*/
  }
}
