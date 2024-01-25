import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tambah Page with DatePicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: tambahPage(),
    );
  }
}
class tambahPage extends StatefulWidget {
  const tambahPage({Key? key}) : super(key: key);
  @override
  State<tambahPage> createState() => _tambahPageState();
}
class _tambahPageState extends State<tambahPage> {
  TextEditingController namatextcontroller = TextEditingController();
  TextEditingController alamattextcontroller = TextEditingController();
  TextEditingController umurtextcontroller = TextEditingController();
  TextEditingController penyakitKronistextcontroller = TextEditingController();
  TextEditingController nomorTelepontextcontroller = TextEditingController();
  TextEditingController kunjunganController = TextEditingController();
  DateTime? selectedDate;
  String? selectedKunjungan;
  final List<String> kunjunganOptions = ['Kunjungan1', 'Kunjungan2', 'Kunjungan3', 'Kunjungan4', 'Kunjungan5'];
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
                              keyboardType: TextInputType.number,
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
                              onTap: () {
                                _selectDate(context);
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Tanggal Kunjungan',
                              ),
                              controller: TextEditingController(
                                text: selectedDate != null
                                    ? DateFormat('dd-MM-yyyy').format(selectedDate!)
                                    : '',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: DropdownButtonFormField(
                              value: selectedKunjungan,
                              items: kunjunganOptions.map((String kunjungan) {
                                return DropdownMenuItem(
                                  value: kunjungan,
                                  child: Text(kunjungan),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  selectedKunjungan = value;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'Kunjungan',
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: ElevatedButton(
                              onPressed: () {
                                _tambahData();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 255, 111, 111),
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
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  void _tambahData() async {
    try {
      await _firestore.collection('kunjungan').add({
        'nama': namatextcontroller.text,
        'alamat': alamattextcontroller.text,
        'umur': int.tryParse(umurtextcontroller.text) ?? 0,
        'penyakitKronis': penyakitKronistextcontroller.text,
        'nomorTelepon': nomorTelepontextcontroller.text,
        'tanggalKunjungan': selectedDate != null
            ? DateFormat('dd-MM-yyyy').format(selectedDate!)
            : '',
        'kunjungan': selectedKunjungan,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data kunjungan berhasil ditambahkan!'),
        ),
      );
      namatextcontroller.clear();
      alamattextcontroller.clear();
      umurtextcontroller.clear();
      penyakitKronistextcontroller.clear();
      nomorTelepontextcontroller.clear();
      setState(() {
        selectedDate = null;
        selectedKunjungan = null;
      });
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan. Silakan coba lagi.'),
        ),
      );
    }
  }
}
