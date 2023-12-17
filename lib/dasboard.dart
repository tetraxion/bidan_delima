import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:bidan1/home.dart';
import 'package:bidan1/utilis.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:bidan1/EditPage.dart';

class DashboardBidan extends StatefulWidget {
  const DashboardBidan({super.key});

  @override
  State<DashboardBidan> createState() => _DashboardBidanState();
}

class _DashboardBidanState extends State<DashboardBidan> {
  // Uint8List? _image;

  // Future<void> selectImage() async {
  //   Uint8List img = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = img;
  //   });
  // }
  File? _image;

  Future<void> _selectImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 40,
      );

      if (pickedFile != null) {
        print("Selected image path: ${pickedFile.path}");

        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Color.fromARGB(255, 232, 194, 194),
      // ),
      body: SafeArea(
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
              Container(
                height: 150,
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
                      height: 90,
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
                  left: 8,
                  right: 8,
                  top: 120,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(95.0),
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(95.0),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x19000000),
                                    blurRadius: 24,
                                    offset: Offset(0, 11),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Column(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.center,
                                    //   children: [
                                    //     Container(
                                    //       width: 30,
                                    //       height: 30,
                                    //       child: Image.asset(
                                    //         "assets/icon/icon_search.png",
                                    //         width: 120.0,
                                    //         height: 120.0,
                                    //         fit: BoxFit.fill,
                                    //       ),
                                    //     ),
                                    //     SizedBox(
                                    //       height: 6,
                                    //     ),
                                    //     Text(
                                    //       'Jadwal',
                                    //       style: TextStyle(
                                    //         fontSize: 10,
                                    //         color: Colors.black,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    // Stack(
                                    //   children: [
                                    //     CircleAvatar(
                                    //       radius: 40,
                                    //       foregroundColor: Colors.grey,
                                    //       backgroundImage: AssetImage(
                                    //           "assets/icon/icon_input.png"),
                                    //     ),
                                    //     Positioned(
                                    //       top: -10,
                                    //       child: IconButton(
                                    //         onPressed: () {},
                                    //         icon: const Icon(
                                    //           Icons.add_a_photo,
                                    //           size: 15.0,
                                    //         ),
                                    //       ),
                                    //     )
                                    //   ],
                                    // ),
                                    // Stack(
                                    //   children: [
                                    //     _image != null
                                    //         ? CircleAvatar(
                                    //             radius: 40,
                                    //             backgroundImage:
                                    //                 FileImage(_image!),
                                    //             boxShadow: [
                                    //               BoxShadow(
                                    //                 color: Colors.black
                                    //                     .withOpacity(0.2),
                                    //                 blurRadius: 8.0,
                                    //                 offset: Offset(0, 4),
                                    //               ),
                                    //             ],
                                    //           )
                                    //         : CircleAvatar(
                                    //             radius: 40,
                                    //             backgroundImage: AssetImage(
                                    //                 "assets/icon/icon_input.png"),
                                    //             backgroundColor: Colors.white,
                                    //             boxShadow: [
                                    //               BoxShadow(
                                    //                 color: Colors.black
                                    //                     .withOpacity(0.2),
                                    //                 blurRadius: 8.0,
                                    //                 offset: Offset(0, 4),
                                    //               ),
                                    //             ],
                                    //           ),
                                    //     Positioned(
                                    //       top: -10,
                                    //       child: IconButton(
                                    //         onPressed: _selectImage,
                                    //         icon: const Icon(
                                    //           Icons.add_a_photo,
                                    //           size: 15.0,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    Stack(
                                      children: [
                                        _image != null
                                            ? CircleAvatar(
                                                radius: 40,
                                                backgroundImage:
                                                    FileImage(_image!),
                                              )
                                            : CircleAvatar(
                                                radius: 40,
                                                backgroundImage: AssetImage(
                                                    "assets/icon/icon_input.png"),
                                                backgroundColor: Colors
                                                    .blue, // Ganti warna latar belakang
                                              ),
                                        Positioned(
                                          top: -10,
                                          child: IconButton(
                                            onPressed: _selectImage,
                                            icon: const Icon(
                                              Icons.add_a_photo,
                                              size: 15.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                            "assets/icon/icon_search1.png",
                                            width: 120.0,
                                            height: 120.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text('Cari Jadwal',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                            "assets/icon/icon_mail.png",
                                            width: 120.0,
                                            height: 120.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Masukan',
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
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            child: Icon(
                                              Icons
                                                  .access_alarm, // Ganti dengan ikon yang sesuai
                                              color: const Color.fromARGB(255, 255, 255, 255), // Ganti dengan warna yang diinginkan
                                            ),
                                          ),
                                          Text(
                                            '',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 30)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              //=================================gest==========================
              Positioned(
                right: 3,
                top: 110,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditPage()),
                    );
                  },
                  child: Container(
                    height: 130,
                    width: 123,
                    child: Image.asset(
                      "assets/icon/icon_plus.png",
                      width: 122.0,
                      height: 200.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              //=================================gest==========================
              // Positioned(
              //   right: 3,
              //   top: 186,
              //   child: Container(
              //     child: Image.asset(
              //       "assets/icon/icon_plus.png",
              //       width: 130.0,
              //       height: 188.0,
              //       fit: BoxFit.fill,
              //     ),
              //     height: 115,
              //     width: 115,
              //   ),
              // ),
              Positioned(
                left: 0,
                right: 0,
                top: 240,
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
              Positioned(
                left: 0,
                right: 0,
                top: 490,
                child: Container(
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
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Jadwal Hari ini",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Container(
                                  //   width: 90,
                                  //   height: 90,
                                  //   margin: EdgeInsets.only(right: 10.0),
                                  //   decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //       image: NetworkImage(
                                  //         "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1173&q=80",
                                  //       ),
                                  //       fit: BoxFit.cover,
                                  //     ),
                                  //     borderRadius: BorderRadius.all(
                                  //       Radius.circular(16.0),
                                  //     ),
                                  //     color: Colors.blue[400],
                                  //   ),
                                  //   child: Stack(
                                  //     children: [
                                  //       Container(
                                  //         padding: EdgeInsets.all(6.0),
                                  //         margin: EdgeInsets.all(8.0),
                                  //         decoration: BoxDecoration(
                                  //           color: Colors.green[800],
                                  //           borderRadius: BorderRadius.all(
                                  //             Radius.circular(
                                  //               12.0,
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         child: Text(
                                  //           "PROMO",
                                  //           style: TextStyle(
                                  //             color: Colors.white,
                                  //             fontSize: 8.0,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Roti bakar Cimanggis",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6.0,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "8.1 km",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 4.0,
                                            ),
                                            Icon(
                                              Icons.circle,
                                              size: 4.0,
                                            ),
                                            SizedBox(
                                              width: 4.0,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange[400],
                                              size: 16.0,
                                            ),
                                            Text(
                                              "4.8",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6.0,
                                        ),
                                        Text(
                                          "Bakery & Cake . Breakfast . Snack",
                                          style: TextStyle(
                                            fontSize: 10.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6.0,
                                        ),
                                        Text(
                                          "€24",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
