class Doctor {
  int? id_doctor;
  String? doctor_name;
  String? image;
  String? gender;

  Doctor(
      {this.id_doctor,
        this.doctor_name,
        this.image,
        this.gender});

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id_doctor: json['id_doctor'],
    doctor_name: json['doctor_name'],
    image: json['image'],
    gender: json['gender'],
  );

  Map<String, dynamic> toJson() => {
    'id_doctor': id_doctor,
    'doctor_name': doctor_name,
    'image': image,
    'gender': gender,
  };

}

class Specialty {
  int? id_specialty ;
  String? specialty_name ;

  Specialty({this.id_specialty, this.specialty_name});

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
    id_specialty: json['id_specialty'],
    specialty_name: json['specialty_name']
  );

  Map<String, dynamic> toJson() => {
    'id_specialty': id_specialty,
    'specialty_name': specialty_name
  };

}

