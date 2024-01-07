import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bidan1/aut/login.dart'; 

Future<void> logoutUser(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login()),
      (Route<dynamic> route) => false,
    );
  } catch (e) {
    print("Error logging out: $e");
    // Anda bisa menampilkan pesan error jika diperlukan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gagal logout. Silakan coba lagi.')),
    );
  }
}
