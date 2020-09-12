import 'package:firebase_auth/firebase_auth.dart';
import 'package:guzel_ama_ingilicce/models/user.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //making firebaseuser to custom user
  CUser _userFromFirebaseUser(User user){
    if(user != null)
      return CUser(uid: user.uid);
    else
      return null;
  }

  //sign out
  Future signOut() async{
    try{
      return await _firebaseAuth.signOut();
    }catch(e){
      return null;
    }

  }

  //user stream for auth changes
  Stream<CUser> get user{
    return _firebaseAuth.authStateChanges().map((User user) => _userFromFirebaseUser(user));
  }

  //sign in anon
  Future signInAnon() async{
    try{
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email & password
  Future createUserWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}