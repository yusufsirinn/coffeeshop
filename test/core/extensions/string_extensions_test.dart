import 'package:coffeeshop/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('String args extension method', () {
    String template = 'This is a test with {0} and {1}';
    List<String> arguments = ['argument1', 'argument2'];

    String result = template.args(arguments);

    expect(result, 'This is a test with argument1 and argument2');
  });

  test('String args extension method with missing arguments', () {
    String template = 'This is a test with {0} and {1}';
    List<String> arguments = ['argument1'];

    String result = template.args(arguments);

    expect(result, 'This is a test with argument1 and {1}');
  });

  test('String args extension method with extra arguments', () {
    String template = 'This is a test with {0}';
    List<String> arguments = ['argument1', 'argument2'];

    String result = template.args(arguments);

    expect(result, 'This is a test with argument1');
  });
}
