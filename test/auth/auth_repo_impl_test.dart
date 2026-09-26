import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/core/enums/role_enum.dart';
import 'package:doctor_hunt/features/auth/data/repo/auth_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([
  FirebaseAuth,
  FirebaseFirestore,
  UserCredential,
  User,
  CollectionReference,
  DocumentReference,
  DocumentSnapshot,
])
void main() {
  late MockFirebaseAuth firebaseAuth;
  late MockFirebaseFirestore fireStore;
  late MockUserCredential userCredential;
  late MockUser user;

  late MockCollectionReference<Map<String, dynamic>> firebaseCollection;
  late MockDocumentReference<Map<String, dynamic>> firebaseDocument;

  late AuthRepoImpl authRepo;

  setUp(() {
    firebaseAuth = MockFirebaseAuth();
    fireStore = MockFirebaseFirestore();
    userCredential = MockUserCredential();
    user = MockUser();

    firebaseCollection = MockCollectionReference<Map<String, dynamic>>();

    firebaseDocument = MockDocumentReference<Map<String, dynamic>>();

    authRepo = AuthRepoImpl(firebaseAuth: firebaseAuth, fireStore: fireStore);
  });

  group('Test Sign Up Cases', () {
    test('Test When Role Is Admin', () async {
      final result = await authRepo.signUpWithEmailAndPassword(
        email: 'admin@test.com',
        password: '123456',
        name: 'Admin',
        role: Role.admin,
      );

      expect(result.isLeft(), true);

      result.fold((error) {
        expect(error, 'Sign up only for patients');
      }, (_) => null);
    });

    test('Test When Call Firebase', () async {
      when(
        firebaseAuth.createUserWithEmailAndPassword(
          email: 'patient@test.com',
          password: '123456',
        ),
      ).thenAnswer((_) async => userCredential);

      when(userCredential.user).thenReturn(user);

      when(user.uid).thenReturn('123');

      when(fireStore.collection('users')).thenReturn(firebaseCollection);

      when(firebaseCollection.doc('user_123')).thenReturn(firebaseDocument);

      when(
        firebaseDocument.set({'role': Role.patient.index}),
      ).thenAnswer((_) async {});

      when(fireStore.collection('patients')).thenReturn(firebaseCollection);
      when(firebaseCollection.doc('patient_123')).thenReturn(firebaseDocument);
      when(
        firebaseDocument.set({'name': 'Mostafa', 'email': "patient@test.com"}),
      ).thenAnswer((_) async {});

      final result = await authRepo.signUpWithEmailAndPassword(
        email: 'patient@test.com',
        password: '123456',
        name: 'Mostafa',
        role: Role.patient,
      );

      expect(result.isRight(), true);
    });
  });
}
