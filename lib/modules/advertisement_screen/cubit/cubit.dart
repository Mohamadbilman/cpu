import 'dart:convert';
import 'package:cpu/modules/advertisement_screen/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AdsCubit extends Cubit<AdsStates> {
  AdsCubit() : super(AdsInitialState());
  static AdsCubit get(context) => BlocProvider.of(context);
  List cpu = [];
  Future getdata() async {
    final response = await http.get(
        Uri.parse(
            'http://cordobaa1-001-site1.itempurl.com/api/apiadvertisement'),
        headers: {
          "Content-Type": "application/json",
        }).then((value) {
      var body = jsonDecode(value.body);
      cpu.addAll(body);
      emit(adsSuccessHomeDataState());
    }).catchError((error) {
      emit(adsErrorHomeDataState());
      print(error.toString());
    });
  }

  void getApi() {
    emit(adsLoadingHomeDataState());
    getdata();
  }
}
