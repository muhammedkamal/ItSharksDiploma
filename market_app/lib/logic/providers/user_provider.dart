import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> isAuthenticated() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<bool> register(
      {required String mail, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: password);
      FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({"email": userCredential.user!.email});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<bool> authenticate(
      {required String mail, required String password}) async {
    try {
      print("here");
      var userCr = await _firebaseAuth
          .signInWithEmailAndPassword(email: mail, password: password)
          .then((value) => print(value));
      print(await _firebaseAuth.currentUser!.getIdToken());
    } catch (e) {
      return false;
    }
    return true;
  }

  String getUserId() {
    return _firebaseAuth.currentUser!.uid;
  }
}
