import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vista_sp2/models/doctorModel.dart';

class FetchDoctorList {
  var data = [];
  List<Doctor> results = [];
  String urlList = 'http://192.168.1.12:3000/api/doctorSpecialty/all'; //CAMBIAR
  //String urlList = 'http://localhost:3000/api/doctorSpecialty/all';

  Future<List<Doctor>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);
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

}
