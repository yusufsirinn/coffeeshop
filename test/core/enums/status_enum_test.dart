import 'package:coffeeshop/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Status enum -', () {
    test('isInitial should return true only for Status.initial', () {
      expect(Status.initial.isInitial, isTrue);
      expect(Status.loading.isInitial, isFalse);
      expect(Status.success.isInitial, isFalse);
      expect(Status.failure.isInitial, isFalse);
    });

    test('isLoading should return true only for Status.loading', () {
      expect(Status.initial.isLoading, isFalse);
      expect(Status.loading.isLoading, isTrue);
      expect(Status.success.isLoading, isFalse);
      expect(Status.failure.isLoading, isFalse);
    });

    test('isSuccess should return true only for Status.success', () {
      expect(Status.initial.isSuccess, isFalse);
      expect(Status.loading.isSuccess, isFalse);
      expect(Status.success.isSuccess, isTrue);
      expect(Status.failure.isSuccess, isFalse);
    });

    test('isFailure should return true only for Status.failure', () {
      expect(Status.initial.isFailure, isFalse);
      expect(Status.loading.isFailure, isFalse);
      expect(Status.success.isFailure, isFalse);
      expect(Status.failure.isFailure, isTrue);
    });
  });
}
