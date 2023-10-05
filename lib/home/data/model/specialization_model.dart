import 'package:equatable/equatable.dart';
import 'package:my_app/util/model/doctor.dart';


class SpecializationModel extends Equatable {
	final int? id;
	final String? name;
	final List<Doctors>? doctors;

	const SpecializationModel({this.id, this.name, this.doctors});

	factory SpecializationModel.fromJson(Map<String, dynamic> json) {
		return SpecializationModel(
			id: json['id'] as int?,
			name: json['name'] as String?,
			doctors: (json['doctors'] as List<dynamic>?)
						?.map((e) => Doctors.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'doctors': doctors?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [id, name, doctors];
}
