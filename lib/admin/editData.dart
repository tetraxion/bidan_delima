import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Page with DatePicker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EditPage(docId: 'someDocumentId'), // Gantikan dengan ID dokumen yang sesuai
    );
  }
}

class EditPage extends StatefulWidget {
  final String docId;

  EditPage({required this.docId});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController namatextcontroller = TextEditingController();
  TextEditingController alamattextcontroller = TextEditingController();
  TextEditingController umurtextcontroller = TextEditingController();
  TextEditingController penyakitKronistextcontroller = TextEditingController();
  TextEditingController nomorTelepontextcontroller = TextEditingController();
  DateTime? selectedDate;
  String? selectedKunjungan;
  final List<String> kunjunganOptions = ['Kunjungan1', 'Kunjungan2', 'Kunjungan3', 'Kunjungan4', 'Kunjungan5'];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final DocumentSnapshot document = await _firestore.collection('kunjungan').doc(widget.docId).get();
      final data = document.data() as Map<String, dynamic>;

      setState(() {
        namatextcontroller.text = data['nama'] ?? '';
        alamattextcontroller.text = data['alamat'] ?? '';
        umurtextcontroller.text = data['umur'].toString() ?? '';
        penyakitKronistextcontroller.text = data['penyakitKronis'] ?? '';
        nomorTelepontextcontroller.text = data['nomorTelepon'] ?? '';
        selectedKunjungan = data['kunjungan'];
        selectedDate = data['tanggalKunjungan'] != null
            ? DateFormat('dd-MM-yyyy').parse(data['tanggalKunjungan'])
            : null;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _updateData() async {
    try {
      await _firestore.collection('kunjungan').doc(widget.docId).update({
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
          content: Text('Data kunjungan berhasil diperbarui!'),
        ),
      );
    } catch (e) {
      print('Error updating data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan. Silakan coba lagi.'),
        ),
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
                              decoration: InputDecoration(labelText: 'Penyakit Kronis'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              controller: nomorTelepontextcontroller,
                              decoration: InputDecoration(labelText: 'Nomor Telepon'),
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
                                _updateData();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 255, 111, 111),
                              ),
                              child: Text('Simpan Perubahan'),
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
