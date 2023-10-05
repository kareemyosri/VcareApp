import 'package:equatable/equatable.dart';

class Patient extends Equatable {
	final int? id;
	final String? name;
	final String? email;
	final String? phone;
	final String? gender;

	const Patient({this.id, this.name, this.email, this.phone, this.gender});

	factory Patient.fromJson(Map<String, dynamic> json) => Patient(
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				phone: json['phone'] as String?,
				gender: json['gender'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'email': email,
				'phone': phone,
				'gender': gender,
			};

	@override
	List<Object?> get props => [id, name, email, phone, gender];
}
