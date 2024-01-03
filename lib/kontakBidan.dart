// ignore_for_file: deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Kontak extends StatelessWidget {
  const Kontak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Hubungi Bidan Delima via WhatsApp?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Batal'),
                child: const Text('Batal'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'Ya');
                  _contactBidanDelima(context);
                },
                child: const Text('YA'),
              ),
            ],
          ),
        );
      },
      child: Container(
        width: 30,
        height: 30,
        child: Image.asset(
          "assets/icon/icon_message.png",
          width: 120.0,
          height: 120.0,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Future<void> _contactBidanDelima(BuildContext context) async {
    final phoneNumber = '6282335481033';
    final message = 'Selamat datang di Bidan Delima! Apakah ada yang ingin Anda tanyakan?';

    final whatsappUrl = 'https://api.whatsapp.com/send?phone=$phoneNumber&text=${Uri.encodeFull(message)}';

    try {
      if (await canLaunch(whatsappUrl)) {
        await launch(whatsappUrl);
      } else {
        _launchInAppBrowser(context, whatsappUrl);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Terjadi kesalahan: $e')));
    }
  }

  Future<void> _launchInAppBrowser(BuildContext context, String url) async {
    try {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal membuka WhatsApp.')));
    }
  }
}
