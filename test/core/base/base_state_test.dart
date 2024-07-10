import 'package:coffeeshop/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BaseState -', () {
    test('should properly compare two BaseState objects', () {
      const state1 = TestState(status: Status.loading, errorMessage: null);
      const state2 = TestState(status: Status.loading, errorMessage: null);
      const state3 = TestState(status: Status.failure, errorMessage: 'Error occurred');

      expect(state1, equals(state2));
      expect(state1 == state3, isFalse);
    });

    test('should have correct props', () {
      const state = TestState(status: Status.success, errorMessage: null);

      expect(state.props, [Status.success, null]);
    });
  });
}

class TestState extends BaseState {
  const TestState({
    required super.status,
    super.errorMessage,
  });

  @override
  List<Object?> get props => [status, errorMessage];
}
