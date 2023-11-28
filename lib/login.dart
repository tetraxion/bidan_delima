import 'package:bidan1/dasboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // initialize firebase App
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found');
      } else {
        print('Error: $e');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 232, 194, 194),
      ),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildLoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  Widget _buildLoginScreen() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/loadingbg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 175.0,
                    height: 215.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Container(
            height: 355,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
            ),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "Login",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle_rounded,
                          size: 24.0,
                        ),
                        labelText: 'Login',
                        fillColor: Color.fromARGB(255, 232, 194, 194),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          size: 24.0,
                        ),
                        labelText: 'Password',
                        fillColor: Color.fromARGB(255, 232, 194, 194),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 111, 111),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    fixedSize: Size(380, 0),
                  ),
                  onPressed: () async {
                    User? user = await loginUsingEmailPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context,
                    );
                    print(user);

                    if (user != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => DashboardBidan(),
                        ),
                      );
                      print('Logged in: ${user.email}');
                    }
                  },
                  child: Text('Masuk'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
