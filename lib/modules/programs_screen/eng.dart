import 'package:cpu/modules/drawer/my_drawer.dart';
import 'package:cpu/modules/programs_screen/cubit/cubit.dart';
import 'package:cpu/modules/programs_screen/cubit/states.dart';
import 'package:cpu/shared/component/component.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Eng_program extends StatefulWidget {
  const Eng_program({Key? key}) : super(key: key);

  @override
  State<Eng_program> createState() => _Eng_programState();
}

class _Eng_programState extends State<Eng_program> {
  @override
  void initState() {
    WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => programsCubit()..getProgramsApi(),
      child: BlocConsumer<programsCubit, programsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final Uri _url = Uri.parse(
                'http://cordobaa1-001-site1.itempurl.com/Schedule/ScheduleList?id=3');

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
                    )));
          }),
    );
  }
}
// http://cordobaa1-001-site1.itempurl.com/Subject/SubjectList?id=3
// http://cordobaa1-001-site1.itempurl.com/Schedule/ScheduleList?id=3
