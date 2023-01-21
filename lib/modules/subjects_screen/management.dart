import 'package:cpu/modules/drawer/my_drawer.dart';
import 'package:cpu/shared/component/component.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class Management_Subject extends StatelessWidget {
  const Management_Subject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(
        'http://cordobaa1-001-site1.itempurl.com/Subject/SubjectList?id=2');
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $_url';
      }
    }

    return SafeArea(
        child: Scaffold(
      appBar: my_AppBar(),
      endDrawer: const My_Drawer(),
      body: Center(
        child: MaterialButton(
          color: HexColor('#00994C'),
          onPressed: _launchUrl,
          child: const Text(
            'عرض المواد',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    ));
  }
}
