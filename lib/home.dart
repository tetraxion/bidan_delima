import 'package:bidan1/login.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Color.fromARGB(255, 232, 194, 194),
      // ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/loadingbg.png"),
          fit: BoxFit.cover,
        )),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 253,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 232, 194, 194),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 50.0,
                      height: 60.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 232, 194, 194),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'TPMB TMM DJAMINI',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Gemol ID No 38 Wiyung Surabaya',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 232, 194, 194),
                    ),
                    child: PopupIcon(),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 190,
              bottom: 0,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 90,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 24,
                              offset: Offset(0, 11),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    "assets/icon/icon_search.png",
                                    width: 120.0,
                                    height: 120.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Jadwal',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    "assets/icon/icon_message.png",
                                    width: 120.0,
                                    height: 120.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Kontak Bidan',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    "assets/icon/icon_question.png",
                                    width: 120.0,
                                    height: 120.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'FAQ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    "assets/icon/icon_heart.png",
                                    width: 120.0,
                                    height: 120.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Masukan dan\nSaran',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 290,
              bottom: 0,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  width: 200,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      DateFormat('EEEE, d\nMMMM\nyyyy', 'en_US')
                          .format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                transform: Matrix4.translationValues(0.0, 460, 0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        transform: Matrix4.translationValues(0.0, 20, 0),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32.0),
                                topRight: Radius.circular(32.0))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Jadwal Hari Ini",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                padding: const EdgeInsets.all(0.0),
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 202, 196, 195),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              10.0,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Ayu Puspita",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "KUNJUNGAN 1",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 202, 196, 195),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              10.0,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Ayu Puspita",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "KUNJUNGAN 1",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 202, 196, 195),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              10.0,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Ayu Puspita",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "KUNJUNGAN 1",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 202, 196, 195),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              10.0,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Ayu Puspita",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "KUNJUNGAN 1",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 202, 196, 195),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              10.0,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Ayu Puspita",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "KUNJUNGAN 1",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 202, 196, 195),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              10.0,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Ayu Puspita",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "KUNJUNGAN 1",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 202, 196, 195),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              10.0,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Ayu Puspita",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "KUNJUNGAN 1",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PopupIcon extends StatelessWidget {
  const PopupIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Login sebagai bidan ?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Tidak'),
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Ya');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: const Text('YA'),
              ),
            ],
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 232, 194, 194),
        ),
        child: Icon(
          Icons.login_outlined,
          size: 20.0,
          color: Color.fromARGB(255, 239, 67, 124),
        ),
      ),
    );
  }
}
