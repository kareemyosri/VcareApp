import 'package:equatable/equatable.dart';

import 'data.dart';

class BookingModel extends Equatable {
	final String? message;
	final Data? data;
	final bool? status;
	final int? code;

	const BookingModel({this.message, this.data, this.status, this.code});

	factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
				message: json['message'] as String?,
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
				status: json['status'] as bool?,
				code: json['code'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.toJson(),
				'status': status,
				'code': code,
			};

	@override
	List<Object?> get props => [message, data, status, code];
}
