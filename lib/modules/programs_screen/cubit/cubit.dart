import 'dart:convert';

import 'package:cpu/modules/programs_screen/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class programsCubit extends Cubit<programsStates> {
  programsCubit() : super(programsInitialState());
  static programsCubit get(context) => BlocProvider.of(context);

  List cpuProgram = [];
  List engName = [];
  List managementName = [];
  Future getProgramdata() async {
    final response = await http.get(
        Uri.parse('http://cordobaa1-001-site1.itempurl.com/api/apischedule'),
        headers: {
          "Content-Type": "application/json",
          "Server": "Microsoft-IIS/10.0"
        }).then((value) {
      var body = jsonDecode(value.body);
      cpuProgram.addAll(body);

      emit(programsSuccessHomeDataState());
    }).catchError((error) {
      emit(programsErrorHomeDataState());
      print(error.toString());
    });
  }

  void getProgramsApi() {
    emit(programsLoadingHomeDataState());
    getProgramdata();
  }
}
