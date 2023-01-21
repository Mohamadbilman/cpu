import 'package:cpu/modules/drawer/my_drawer.dart';
import 'package:cpu/modules/programs_screen/eng.dart';
import 'package:cpu/modules/programs_screen/management.dart';
import 'package:cpu/shared/component/component.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Programs extends StatelessWidget {
  const Programs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 1.5;
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
            appBar: my_AppBar(),
            endDrawer: const My_Drawer(),
            body: Column(
              children: [
                topContainer(text: "قائمة البرامج", width: double.infinity),
                defaultButton(
                    width: width,
                    color: HexColor('#00994C'),
                    function: () {
                      navigateTo(context, const Eng_program());
                    },
                    text: 'كلية الهندسة'),
                defaultButton(
                    width: width,
                    color: HexColor('#00994C'),
                    function: () {
                      navigateTo(context, const Management_program());
                    },
                    text: 'كلية الادارة'),
              ],
            )),
      ),
    );
  }
}
