import 'package:cpu/modules/drawer/my_drawer.dart';
import 'package:cpu/modules/programs_screen/cubit/cubit.dart';
import 'package:cpu/modules/programs_screen/cubit/states.dart';
import 'package:cpu/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class Management_program extends StatelessWidget {
  const Management_program({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => programsCubit(),
      child: BlocConsumer<programsCubit, programsStates>(
          builder: (context, state) {
            final Uri _url = Uri.parse(
                'http://cordobaa1-001-site1.itempurl.com/Schedule/ScheduleList?id=2');
            Future<void> _launchUrl() async {
              if (!await launchUrl(_url,
                  mode: LaunchMode.externalApplication)) {
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
                    'عرض البرامج',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ));
          },
          listener: (context, state) {}),
    );
  }
}
