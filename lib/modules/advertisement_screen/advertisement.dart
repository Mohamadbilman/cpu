import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cpu/modules/advertisement_screen/cubit/cubit.dart';
import 'package:cpu/modules/advertisement_screen/cubit/states.dart';
import 'package:cpu/modules/drawer/my_drawer.dart';
import 'package:cpu/shared/component/component.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Advertisement_Screen extends StatelessWidget {
  const Advertisement_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AdsCubit()..getApi(),
      child: BlocConsumer<AdsCubit, AdsStates>(
          builder: (context, state) {
            var cubit = AdsCubit.get(context);

            double height = MediaQuery.of(context).size.height;
            return SafeArea(
              child: Scaffold(
                  appBar: my_AppBar(
                      leading: IconButton(
                          onPressed: () {
                            cubit.getApi();
                          },
                          icon: const Icon(Icons.refresh))),
                  endDrawer: const My_Drawer(),
                  body: ConditionalBuilder(
                      condition: state is adsLoadingHomeDataState ||
                              state is adsErrorHomeDataState
                          ? false
                          : true,
                      builder: (context) {
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              topContainer(
                                  width: double.infinity,
                                  text: 'قائمة الإعلانات'),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: height - 150,
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var faculty =
                                        cubit.cpu[index]['facultyName'];
                                    var facultyName;
                                    if (faculty == null) {
                                      facultyName = 'الادمن';
                                    } else {
                                      facultyName =
                                          cubit.cpu[index]['facultyName'];
                                    }
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: HexColor('#00994C'),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Text(
                                                facultyName,
                                                style: const TextStyle(
                                                    color: Colors.yellow,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 35),
                                              ),
                                            ),
                                            Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Text(
                                                "${AdsCubit.get(context).cpu[index]['advertisementDescription']}",
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      Container(
                                    color: Colors.grey,
                                    height: 2,
                                    width: double.infinity,
                                  ),
                                  itemCount: AdsCubit.get(context).cpu.length,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      fallback: (context) => Center(
                              child: CircularProgressIndicator(
                            color: HexColor("#00AE46"),
                          )))),
            );
          },
          listener: (context, state) {}),
    );
  }
}

//   Widget AdsBuilder(
//     double height,
//   ) =>
//     ;
// }
