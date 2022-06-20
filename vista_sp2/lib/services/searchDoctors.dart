import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vista_sp2/models/doctorModel.dart';

class FetchDoctorList {
  var data = [];
  List<Doctor> results = [];
  String urlList = 'AGREGAR URL'; //CAMBIAR

  Future<List<Doctor>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body);
       results = data.map((e) => Doctor.fromJson(e)).toList();
        if (query!= null){
       //REVISAR ... //results = results.where((element) => element.name!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}