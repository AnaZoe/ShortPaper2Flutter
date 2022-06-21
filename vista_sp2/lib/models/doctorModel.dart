import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Doctor {
  int? id_doctor;
  String? doctor_name;
  String? image;
  String? gender;
  List<Specialty> specialty = [];

  Doctor(id_doctor, doctor_name, image, gender, specialty) {
    this.id_doctor;
    this.doctor_name;
    this.image;
    this.gender;
    this.specialty;
  }

  static fromJson(Map<String, dynamic> json) {
    return Doctor(json["id_doctor"], json["doctor_name"], json["image"],
        json["gender"], Specialty.Rezando(json['specialty'])
        /*id_doctor: json['id_doctor'],
      doctor_name: json['doctor_name'],
      image: json['image'],
      gender: json['gender'],
      specialty: Specialty.Rezando(json['specialty'])*/
        );

    /* Map<String, dynamic> toJson() => {
          'id_doctor': id_doctor,
          'doctor_name': doctor_name,
          'image': image,
          'gender': gender,
          'specialty': specialty
        };*/
  }
}

class Specialty {
  int? id_specialty;
  String? specialty_name;

  Specialty({this.id_specialty, this.specialty_name});

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
      id_specialty: json['id_specialty'],
      specialty_name: json['specialty_name']);

/*aca deberia ir el json donde estan todas las especialidades */
  static List<Specialty> Rezando(String s) {
    print(s);
    var specialties = <Specialty>[];
    var specialtiesJson = json.decode(s);
    for (var specialtyJson in specialtiesJson) {
      specialties.add(Specialty.fromJson(specialtyJson));
    }
    return specialties;
  }

  Map<String, dynamic> toJson() =>
      {'id_specialty': id_specialty, 'specialty_name': specialty_name};
}
