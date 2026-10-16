import 'package:firebase_auth/firebase_auth.dart';

String? getCurrentUserId() {
  var user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    return user.uid;
  } else {
    return null;
  }
}
