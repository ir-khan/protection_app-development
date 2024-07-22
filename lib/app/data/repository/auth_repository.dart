import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> anonymousSign() async {
    var userCredential = await auth.signInAnonymously();
    return userCredential.user;
  }
}
