import 'package:equatable/equatable.dart';

import 'datum.dart';

class HistoryModel extends Equatable {
	final List<Datum>? data;

	const HistoryModel({ this.data});

	factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
				data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'data': data?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [ data];
}
