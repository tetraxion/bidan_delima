import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 232, 194, 194),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/loadingbg.png"),
            fit: BoxFit.cover,
          )),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 200,
                bottom: 0,
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
              Positioned(
                left: 0,
                right: 0,
                top: 450,
                bottom: 0,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 417,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0))),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
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
                                    fontSize: 20.0, color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_outlined,
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
                                    fontSize: 20.0, color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 255, 111, 111),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    15.0), 
                              ),
                              fixedSize: Size(380,0),
                            ),
                            onPressed: () {},
                            child: Text('Masuk'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
