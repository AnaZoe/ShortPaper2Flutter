class Doctor {
  final int? id_doctor;
  final String? doctor_name;
  final String? image;
  final String? gender;
  final List<Specialty> specialty;

  Doctor(
      {required this.id_doctor,
      required this.doctor_name,
      required this.image,
      required this.gender,
      required this.specialty});

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
      id_doctor: json['id_doctor'],
      doctor_name: json['doctor_name'],
      image: json['image'],
      gender: json['gender'],
      specialty: json['specialty']);

  Map<String, dynamic> toJson() => {
        'id_doctor': id_doctor,
        'doctor_name': doctor_name,
        'image': image,
        'gender': gender,
        'specialty': specialty
      };
}

class Specialty {
  int? id_specialty;
  String? specialty_name;

  Specialty({this.id_specialty, this.specialty_name});

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
      id_specialty: json['id_specialty'],
      specialty_name: json['specialty_name']);

  Map<String, dynamic> toJson() =>
      {'id_specialty': id_specialty, 'specialty_name': specialty_name};
}
