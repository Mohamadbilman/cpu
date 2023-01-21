import 'package:cpu/modules/subjects_screen/management.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/component/component.dart';
import '../drawer/my_drawer.dart';
import 'eng.dart';

class Subjects extends StatelessWidget {
  const Subjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1.5;
    return SafeArea(
      child: Scaffold(
          appBar: my_AppBar(),
          endDrawer: const My_Drawer(),
          body: Column(
            children: [
              topContainer(
                  text: "قائمة المواد الدراسية", width: double.infinity),
              defaultButton(
                  width: width,
                  color: HexColor('#00AE46'),
                  function: () {
                    navigateTo(context, Eng_Subjects());
                  },
                  text: 'كلية الهندسة'),
              defaultButton(
                  width: width,
                  color: HexColor('#00AE46'),
                  function: () {
                    navigateTo(context, const Management_Subject());
                  },
                  text: 'كلية الادارة'),
            ],
          )),
    );
  }
}
