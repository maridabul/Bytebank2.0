import 'package:bytebank2/models/trasaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return the value when create a transaction', () {
    final transaction = Transaction(200, null, null);
    expect(transaction.value, 200);
  });

  test('Should display error when create transaction with value less than zero',
      () {
    expect(() => Transaction(0, null, null), throwsAssertionError);
  });
}
