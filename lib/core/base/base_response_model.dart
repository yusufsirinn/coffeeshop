import 'package:equatable/equatable.dart';

abstract class BaseResponseModel extends Equatable {
  fromJson(Map<String, dynamic> json);
}
