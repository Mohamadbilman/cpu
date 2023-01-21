import 'package:cpu/modules/main_screen/main_screen.dart';
import 'package:cpu/modules/programs_screen/programs.dart';
import 'package:cpu/modules/subjects_screen/subjects.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/component/component.dart';
import '../advertisement_screen/advertisement.dart';

class My_Drawer extends StatelessWidget {
  const My_Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('https://www.facebook.com/Mohamad.karamm.12/');
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $_url';
      }
    }

    return Drawer(
      backgroundColor: HexColor('#006134'),
      child: Column(
        children: [
          defaultButton(
              width: double.infinity,
              color: HexColor("#00994C"),
              function: () {
                navigateTo(context, const main_Screen());
              },
              text: "القائمة الرئيسية"),
          defaultButton(
              width: double.infinity,
              color: HexColor("#00994C"),
              function: () {
                navigateAndFinish(context, const Advertisement_Screen());
              },
              text: 'قائمة الإعلانات'),
          defaultButton(
              width: double.infinity,
              color: HexColor("#00994C"),
              function: () {
                navigateTo(context, const Programs());
              },
              text: 'البرامج'),
          defaultButton(
              width: double.infinity,
              color: HexColor("#00994C"),
              function: () {
                navigateTo(context, const Subjects());
              },
              text: 'المواد الدراسية'),
          Container(
            margin: const EdgeInsets.only(top: 10),
            color: Colors.grey,
            height: 3,
            width: double.infinity,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            child: MaterialButton(
                color: Colors.white,
                onPressed: _launchUrl,
                child: RichText(
                  text: TextSpan(
                    text: 'Created By ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontStyle:
                            DefaultTextStyle.of(context).style.fontStyle),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Mohamad Karam',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle:
                                DefaultTextStyle.of(context).style.fontStyle),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
