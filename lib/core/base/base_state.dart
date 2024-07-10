import 'package:equatable/equatable.dart';

import '../enums/status_enum.dart';

abstract class BaseState extends Equatable {
  final Status status;
  final String? errorMessage;
  const BaseState({this.errorMessage, required this.status});
}
