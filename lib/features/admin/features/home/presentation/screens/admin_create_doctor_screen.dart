import 'package:flutter/material.dart';

class AdminCreateDoctorScreen extends StatelessWidget {
  const AdminCreateDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Doctor'),
      ),
      body: const Center(
        child: Text('Admin Create Doctor Screen'),
      ),
    ) ;
  }
}