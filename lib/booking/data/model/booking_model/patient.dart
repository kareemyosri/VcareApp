import 'package:equatable/equatable.dart';

class Patient extends Equatable {
	final int? id;
	final String? name;
	final String? email;
	final String? phone;

	const Patient({this.id, this.name, this.email, this.phone});

	factory Patient.fromJson(Map<String, dynamic> json) => Patient(
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				phone: json['phone'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'email': email,
				'phone': phone,
			};

	@override
	List<Object?> get props => [id, name, email, phone];
}
