import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vista_sp2/models/doctorModel.dart';

class FetchDoctorList {
  static Future<List<Doctor>?> getuserList(String query) async {
    final url = Uri.parse('http://192.168.1.12:3000/api/doctorSpecialty/all');
    final http.Response response;

    try {
      response = await http.get(url);
    } catch (e) {
      throw Exception('Ocurrio un error.');
    }
    final List jsonData;
    List<Doctor>? result;

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      jsonData = jsonDecode(body);
      //  print(jsonData[0]);

      if (jsonData.isNotEmpty) {
        result = jsonData.map((json) => Doctor.fromJson(json)).toList();
        print(result);
        return result;
      } else {
        return result = [];
      }
    } else {
      return result;
    }
  }
}
  /*var data = [];
  List<Doctor> results = [];
  String urlList = 'http://192.168.1.12:3000/api/doctorSpecialty/all'; //CAMBIAR

  Future<List<Doctor>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        print(data[0]["doctor_name"]);
        /*for (var item in data) {
          print('iteraciones');
          final doctor = Doctor(item["id_doctor"], item["doctor_name"],
              item["image"], item["gender"], item["specialty"]);
          results.add(doctor);
          print(results[0].doctor_name);
        }*/
        results = data.map<Doctor>((e) => Doctor.fromJson(e)).toList();
        
        if (query != null) {
          results = results
              .where((element) =>
                  element.specialties.contains((query.toLowerCase())))
              .toList();
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

/*class FetchDoctorList {
  var data = [];
  List<Doctor> results = [];
  String urlList = 'http://192.168.1.12:3000/api/doctorSpecialty/all'; //CAMBIAR
  //String urlList = 'http://localhost:3000/api/doctorSpecialty/all';

// Future<List<Doctor>> getuserList({String? query}) async {
  Future<List<Doctor>> getuserList() async {
    await Future.delayed(const Duration(seconds: 1));
    try{
      final url =  Uri.parse(urlList);
      final response = await
    }
   // var url =  Uri.parse(urlList);
    //try {
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final data = jsonDecode(body);
      print(data[0]["doctor_name"]);

      for (var item in data) {
        print('iteraciones');
        final doctor = Doctor(item["id_doctor"], item["doctor_name"],
            item["image"], item["gender"], 'cardiologia');
        results.add(doctor);
      }
      // results = data.map((dynamic item) => Doctor.fromJson(item)).toList();
      // results = data.map((e) => Doctor.fromJson(e)).toList();
      print(results[0].doctor_name);
      return results;
      /*       String body = utf8.decode(response.bodyBytes);
        data = json.decode(body);
        results = data.map((e) => Doctor.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) => element.doctor_name!
                  .toLowerCase()
                  .contains((query.toLowerCase())))
              .toList(); 
        }*/
    } else {
      throw Exception("fallo la conexion");
      //print("fetch error");
    }
  } /*on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }*/

}*/
*/