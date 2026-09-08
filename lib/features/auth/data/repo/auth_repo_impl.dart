import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/features/auth/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final _firebaseAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  @override
  Future<Either<String, Role>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final result = await _fireStore
          .collection('users')
          .doc("user_${_firebaseAuth.currentUser!.uid}")
          .get();

      final roleIndex = result.data()!['role'] as int;
      final role = Role.values[roleIndex];

      return Right(role);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Null>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required Role role,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      if (user != null) {
        await _createUser(user, name, email, role);
      }

      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<void> _createUser(
    User user,
    String name,
    String email,
    Role role,
  ) async {
    await _fireStore.collection('users').doc("user_${user.uid}").set({
      'role': role.index,
    });

    switch (role) {
      case Role.patient:
        await _fireStore.collection("patients").doc("patient_${user.uid}").set({
          "name": name,
          "email": email,
        });

        break;
      case Role.doctor:
        await _fireStore.collection("doctors").doc("doctor${user.uid}").set({
          "name": name,
          "email": email,
        });

        break;
      case Role.admin:
        break;
    }
  }

  @override
  Future<Either<String, Null>> resetPass({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
