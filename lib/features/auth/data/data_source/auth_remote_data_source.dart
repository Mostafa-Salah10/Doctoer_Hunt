import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthRemoteDataSource({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseAuth = firebaseAuth,
       _firebaseFirestore = firebaseFirestore;

  Future<Role> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final result = await _firebaseFirestore
        .collection('users')
        .doc("user_${_firebaseAuth.currentUser!.uid}")
        .get();

    final roleIndex = result.data()!['role'] as int;
    final role = Role.values[roleIndex];

    return role;
  }

  Future<Null> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required Role role,
  }) async {
    if (role == Role.admin) {
      throw Exception("Sign up only for patients");
    }
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user;

    if (user != null) {
      await _createUser(user, name, email, role);
    }

    return null;
  }

  Future<void> _createUser(
    User user,
    String name,
    String email,
    Role role,
  ) async {
    await _firebaseFirestore.collection('users').doc("user_${user.uid}").set({
      'role': role.index,
    });

    if (role == Role.patient) {
      await _firebaseFirestore
          .collection("patients")
          .doc("patient_${user.uid}")
          .set({"name": name, "email": email});
    }
  }

  Future<Null> resetPass({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    return null;
  }
}
