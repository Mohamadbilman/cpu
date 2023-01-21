import 'package:cpu/modules/drawer/my_drawer.dart';
import 'package:cpu/shared/component/component.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../advertisement_screen/advertisement.dart';
import '../programs_screen/programs.dart';
import '../subjects_screen/subjects.dart';

class main_Screen extends StatelessWidget {
  const main_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1.5;
    return SafeArea(
      child: Scaffold(
        appBar: my_AppBar(),
        endDrawer: const My_Drawer(),
        body: Column(
          children: [
            topContainer(text: "القائمة الرئيسية", width: double.infinity),
            const SizedBox(
              height: 10,
            ),
            defaultButton(
                width: width,
                color: HexColor('#007BFF'),
                function: () {
                  navigateAndFinish(context, const Advertisement_Screen());
                },
                text: 'الاعلانات'),
            defaultButton(
                width: width,
                color: HexColor('#28A745'),
                function: () {
                  navigateTo(context, const Programs());
                },
                text: 'البرامج'),
            defaultButton(
                width: width,
                color: HexColor('#FFC107'),
                function: () {
                  navigateTo(context, const Subjects());
                },
                text: 'المواد الدراسية')
          ],
        ),
      ),
    );
  }
}
