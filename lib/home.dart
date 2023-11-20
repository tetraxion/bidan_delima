import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 232, 194, 194),
          centerTitle: true,
          leading: Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 200.0,
              height: 200.0,
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'TPMB TMM DJAMINI',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Gemol ID No 38 Wiyung Surabaya',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            Center(
              child: IconButton(
                icon: Icon(
                  Icons.login_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
          ],
          toolbarHeight: 120.0,
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: screenHeight, 
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/loadingbg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
