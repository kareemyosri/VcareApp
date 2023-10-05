import 'package:equatable/equatable.dart';

import '../../../../util/model/doctor.dart';
import 'patient.dart';

class Data extends Equatable {
	final int? id;
	final Doctors? doctor;
	final Patient? patient;
	final String? appointmentTime;
	final String? appointmentEndTime;
	final String? status;
	final String? notes;
	final num? appointmentPrice;

	const Data({
		this.id, 
		this.doctor, 
		this.patient, 
		this.appointmentTime, 
		this.appointmentEndTime, 
		this.status, 
		this.notes, 
		this.appointmentPrice, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				id: json['id'] as int?,
				doctor: json['doctor'] == null
						? null
						: Doctors.fromJson(json['doctor'] as Map<String, dynamic>),
				patient: json['patient'] == null
						? null
						: Patient.fromJson(json['patient'] as Map<String, dynamic>),
				appointmentTime: json['appointment_time'] as String?,
				appointmentEndTime: json['appointment_end_time'] as String?,
				status: json['status'] as String?,
				notes: json['notes'] as String?,
				appointmentPrice: json['appointment_price'] as num?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'doctor': doctor?.toJson(),
				'patient': patient?.toJson(),
				'appointment_time': appointmentTime,
				'appointment_end_time': appointmentEndTime,
				'status': status,
				'notes': notes,
				'appointment_price': appointmentPrice,
			};

	@override
	List<Object?> get props {
		return [
				id,
				doctor,
				patient,
				appointmentTime,
				appointmentEndTime,
				status,
				notes,
				appointmentPrice,
		];
	}
}
