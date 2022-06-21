// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, camel_case_types

class Doctor {
  final int id_doctor;
  final String doctor_name;
  final String image;
  final String gender;
  final List<Specialty> specialties;

  const Doctor(
      {required this.id_doctor,
      required this.doctor_name,
      required this.image,
      required this.gender,
      required this.specialties});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id_doctor: json['id_doctor'],
      doctor_name: json['doctor_name'],
      image: json['image'],
      gender: json['gender'],
      specialties: List<Specialty>.from(json["specialties"]
          .map((specialtyJson) => Specialty.fromJson(specialtyJson))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id_doctor": id_doctor,
        "doctor_name": doctor_name,
        "image": image,
        "gender": gender,
        "specialties": List<dynamic>.from(
            specialties.map((Specialty) => Specialty.toJson())),
      };
}

class Specialty {
  final int? id_specialty;
  final String? specialty_name;

  const Specialty({required this.id_specialty, required this.specialty_name});

  factory Specialty.fromJson(Map<String, dynamic> json) {
    return Specialty(
        id_specialty: json['id_specialty'],
        specialty_name: json['specialty_name']);
  }

  Map<String, dynamic> toJson() =>
      {'id_specialty': id_specialty, 'specialty_name': specialty_name};
}
