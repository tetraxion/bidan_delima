import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController namatextcontroller = TextEditingController();
  TextEditingController alamattextcontroller = TextEditingController();
  TextEditingController umurtextcontroller = TextEditingController();
  TextEditingController penyakitKronistextcontroller = TextEditingController();
  TextEditingController nomorTelepontextcontroller = TextEditingController();
  TextEditingController tanggalKunjungantextcontroller = TextEditingController();

  // Inisialisasi Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
            ),
          ),
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
                        ],
                      ),
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
                              controller: namatextcontroller,
                              decoration: InputDecoration(labelText: 'Nama'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              controller: alamattextcontroller,
                              decoration: InputDecoration(labelText: 'Alamat'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              controller: umurtextcontroller,
                              decoration: InputDecoration(labelText: 'Umur'),
                              keyboardType: TextInputType
                                  .number, // angka
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              controller: penyakitKronistextcontroller,
                              decoration:
                                  InputDecoration(labelText: 'Penyakit Kronis'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              controller: nomorTelepontextcontroller,
                              decoration:
                                  InputDecoration(labelText: 'Nomor Telepon'),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              controller: tanggalKunjungantextcontroller,
                              decoration:
                                  InputDecoration(labelText: 'Tanggal Kunjungan'),
                              
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                //Menambahkan data
                                _tambahData();
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

  // Fungsi untuk menambahkan data ke Firestore
  void _tambahData() async {
    try {
      await _firestore.collection('kunjungan').add({
        'nama': namatextcontroller.text,
        'alamat': alamattextcontroller.text,
        'umur': int.tryParse(umurtextcontroller.text) ?? 0,
        'penyakitKronis': penyakitKronistextcontroller.text,
        'nomorTelepon': nomorTelepontextcontroller.text,
        'tanggalKunjungan': tanggalKunjungantextcontroller.text,
      });

      // Setelah data ditambahkan, Anda bisa tambahkan logika navigasi atau feedback ke pengguna di sini.
      // Contoh:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data kunjungan berhasil ditambahkan!'),
        ),
      );

      // Clear input fi elds
      namatextcontroller.clear();
      alamattextcontroller.clear();
      umurtextcontroller.clear();
      penyakitKronistextcontroller.clear();
      nomorTelepontextcontroller.clear();
      tanggalKunjungantextcontroller.clear();
    } catch (e) {
      // Tangani kesalahan jika terjadi
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan. Silakan coba lagi.'),
        ),
      );
    }
  }
} 
