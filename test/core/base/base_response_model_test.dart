import 'package:coffeeshop/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BaseResponseModel - fromJson', () {
    final json = {'data': 'test data'};

    final TestResponseModel model = TestResponseModel().fromJson(json);

    expect(model, isA<BaseResponseModel>());
    expect(model.data, 'test data');
  });
}

class TestResponseModel extends BaseResponseModel {
  final String data;

  TestResponseModel({this.data = ''});

  @override
  TestResponseModel fromJson(Map<String, dynamic> json) {
    return TestResponseModel(data: json['data'] as String);
  }

  @override
  List<Object?> get props => [data];
}
