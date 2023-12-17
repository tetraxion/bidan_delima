import 'dart:io';
// import 'dart:typed_data';
import 'dart:ui';
// import 'package:bidan1/home.dart';
// import 'package:bidan1/utilis.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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
                height: 100,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 232, 194, 194),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Icon(Icons.arrow_back_ios_new_sharp),
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
                              'Edit Informasi Utama',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 200,
                child: Container(
                  height: 755,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 0.1 * MediaQuery.of(context).size.width),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Nama'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Alamat'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Umur'),
                              keyboardType: TextInputType
                                  .number, // angka
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Penyakit Kronis'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Nomor Telepon'),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Tanggal Kunjungan'),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                //Menambahkan data
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 255, 111, 111), 
                              ),
                              child: Text('Simpan'),
                            ),
                          )
                        ],
                      ),
                    ),
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
