import 'package:firebase_auth/firebase_auth.dart';

Future<User?> createaccount(String name, String email, String password) async{
  FirebaseAuth _auth = FirebaseAuth.instance;

 try {
  UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password
  );
  User? user = userCredential.user;

  if (user != null) {
    print("Account created successfully!");
    return user;
  } else {
    print("Account creation failed");
    return null;
  }
} catch (e) {
  print("Error: $e");
  return null;
}
}

Future<User?> logIn(String email, String password) async{
  FirebaseAuth _auth = FirebaseAuth.instance;

 try {
  UserCredential userCredential = await _auth.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  User? user = userCredential.user;

  if (user != null) {
    print("Login successfully!");
    return user;
  } else {
    print("Login failed");
    return null;
  }
} catch (e) {
  print("Error: $e");
  return null;
}
}

Future logOut() async{
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut();
  }
  catch(e){
    print("Error");
  }
}