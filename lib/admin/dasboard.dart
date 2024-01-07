import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:bidan1/home/home.dart';
import 'package:bidan1/aut/logout.dart';
import 'package:bidan1/service/utilis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:bidan1/admin/tambahData.dart';

class DashboardBidan extends StatefulWidget {
  const DashboardBidan({super.key});
  @override
  State<DashboardBidan> createState() => _DashboardBidanState();
}

class _DashboardBidanState extends State<DashboardBidan> {
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

  List<String> docIDs = [];
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('kunjungan')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  Future<void> hapusData(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('kunjungan')
          .doc(docId)
          .delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil dihapus!')),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan saat menghapus data.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
                                                backgroundColor: Colors.blue,
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
                                              Icons.access_alarm,
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
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
              Positioned(
                right: 3,
                top: 110,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tambahPage()),
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
                      FutureBuilder(
                        future: getDocId(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: docIDs.length,
                              itemBuilder: (context, index) {
                                final docId = docIDs[index];
                                return Dismissible(
                                  key: Key(docId),
                                  onDismissed: (direction) {
                                    hapusData(docId);
                                    setState(() {
                                      docIDs.removeAt(index);
                                    });
                                  },
                                  background: Container(
                                    color: Colors.red,
                                    child:
                                        Icon(Icons.delete, color: Colors.white),
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(right: 20.0),
                                  ),
                                  child: ListTile(
                                    title: Text(docId),
                                  ),
                                );
                              },
                            );
                          }
                        },
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

class PopupIcon extends StatelessWidget {
  const PopupIcon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Logout dari aplikasi?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Batal'),
                child: const Text('Batal'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Ya');
                  logoutUser(context);
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
          Icons.logout_outlined,
          size: 20.0,
          color: Color.fromARGB(255, 239, 67, 124),
        ),
      ),
    );
  }
}
